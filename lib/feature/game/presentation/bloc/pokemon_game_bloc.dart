import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_task/feature/game/domain/entities/game_result.dart';
import 'package:pokemon_task/feature/game/domain/entities/pokemon_entity.dart';
import 'package:pokemon_task/feature/game/domain/params/game_options_params.dart';
import 'package:pokemon_task/feature/game/domain/usecases/calculate_score_usecase.dart';
import 'package:pokemon_task/feature/game/domain/usecases/get_random_pokemon_usecase.dart';
import 'package:pokemon_task/feature/game/domain/usecases/update_leaderboard_usecase.dart';

part 'pokemon_game_event.dart';
part 'pokemon_game_state.dart';
part 'pokemon_game_bloc.freezed.dart';

class PokemonGameBloc extends Bloc<PokemonGameEvent, PokemonGameState> {
  final GetRandomPokemonUsecase _getRandomPokemonUsecase;
  final CalculateScoreUsecase _calculateScoreUsecase;
  final UpdateLeaderboardUsecase _updateLeaderboardUsecase;

  // For tracking the timer
  Timer? _gameTimer;
  int _secondsElapsed = 0;

  PokemonGameBloc(
    this._getRandomPokemonUsecase,
    this._calculateScoreUsecase,
    this._updateLeaderboardUsecase,
  ) : super(const PokemonGameState.initial()) {
    on<StartGame>(_onStartGame);
    on<MakeGuess>(_onMakeGuess);
    on<StartNewRound>(_onStartNewRound);
    on<TimerTick>(_onTimerTick);
  }

  @override
  Future<void> close() {
    _gameTimer?.cancel();
    return super.close();
  }

  void _startTimer(int seconds) {
    _gameTimer?.cancel();
    _secondsElapsed = 0;

    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsElapsed++;

      if (_secondsElapsed >= seconds) {
        timer.cancel();
        add(const PokemonGameEvent.makeGuess("timeout"));
      } else {
        add(PokemonGameEvent.timerTick(_secondsElapsed));
      }
    });
  }

  Future<void> _onStartGame(
    StartGame event,
    Emitter<PokemonGameState> emit,
  ) async {
    emit(const PokemonGameState.loading());

    final options = event.options ?? const GameOptionsParams();

    final pokemonsResult = await _getRandomPokemonUsecase(options);

    pokemonsResult.fold(
      (failure) => emit(PokemonGameState.error(failure.message)),
      (pokemons) {
        // Select a random pokemon as the correct answer
        final random = Random();
        final correctIndex = random.nextInt(pokemons.length);
        final correctPokemon = pokemons[correctIndex];

        // Start the timer
        _startTimer(options.timerSeconds);

        emit(
          PokemonGameState.inProgress(
            pokemons: pokemons,
            correctPokemon: correctPokemon,
            secondsLeft: options.timerSeconds,
            streak: 0,
          ),
        );
      },
    );
  }

  Future<void> _onMakeGuess(
    MakeGuess event,
    Emitter<PokemonGameState> emit,
  ) async {
    if (state is! InProgress) return;

    final currentState = state as InProgress;
    _gameTimer?.cancel();

    final selectedName = event.name;
    final correctName = currentState.correctPokemon.name;
    final isCorrect =
        selectedName == correctName ||
        selectedName == correctName.replaceAll('-', ' ');

    // Update the streak
    final newStreak = isCorrect ? currentState.streak + 1 : 0;

    final result = GameResult(
      correctPokemon: currentState.correctPokemon,
      selectedName: selectedName,
      isCorrect: isCorrect,
      timeSpent: _secondsElapsed,
    );

    // Calculate the score using the dedicated use case
    final score = await _calculateScoreUsecase.call2(
      isCorrect: isCorrect,
      timeSpent: _secondsElapsed,
      streak: currentState.streak,
    );

    // Update the leaderboard using the dedicated use case
    await _updateLeaderboardUsecase.call2(isCorrect: isCorrect, score: score);

    emit(PokemonGameState.result(result: result, streak: newStreak));
  }

  Future<void> _onStartNewRound(
    StartNewRound event,
    Emitter<PokemonGameState> emit,
  ) async {
    if (state is! Result) return;

    final currentStreak = (state as Result).streak;

    emit(const PokemonGameState.loading());

    final options = event.options ?? const GameOptionsParams();

    final pokemonsResult = await _getRandomPokemonUsecase(options);

    pokemonsResult.fold(
      (failure) => emit(PokemonGameState.error(failure.message)),
      (pokemons) {
        // Select a random pokemon as the correct answer
        final random = Random();
        final correctIndex = random.nextInt(pokemons.length);
        final correctPokemon = pokemons[correctIndex];

        // Start the timer
        _startTimer(options.timerSeconds);

        emit(
          PokemonGameState.inProgress(
            pokemons: pokemons,
            correctPokemon: correctPokemon,
            secondsLeft: options.timerSeconds,
            streak: currentStreak,
          ),
        );
      },
    );
  }

  void _onTimerTick(TimerTick event, Emitter<PokemonGameState> emit) {
    if (state is! InProgress) return;

    final currentState = state as InProgress;

    emit(currentState.copyWith(secondsLeft: currentState.secondsLeft - 1));
  }
}
