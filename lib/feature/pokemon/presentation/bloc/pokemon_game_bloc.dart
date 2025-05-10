import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/game_result.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_task/feature/pokemon/domain/params/game_options_params.dart';
import 'package:pokemon_task/feature/pokemon/domain/usecases/get_random_pokemon_usecase.dart';

part 'pokemon_game_event.dart';
part 'pokemon_game_state.dart';
part 'pokemon_game_bloc.freezed.dart';

class PokemonGameBloc extends Bloc<PokemonGameEvent, PokemonGameState> {
  final GetRandomPokemonUsecase _getRandomPokemonUsecase;

  // Для відстеження таймера
  Timer? _gameTimer;
  int _secondsElapsed = 0;

  PokemonGameBloc(this._getRandomPokemonUsecase)
    : super(const PokemonGameState.initial()) {
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
        // Вибираємо випадкового покемона як правильну відповідь
        final random = Random();
        final correctIndex = random.nextInt(pokemons.length);
        final correctPokemon = pokemons[correctIndex];

        // Починаємо таймер
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

    // Оновлюємо стрік
    final newStreak = isCorrect ? currentState.streak + 1 : 0;

    final result = GameResult(
      correctPokemon: currentState.correctPokemon,
      selectedName: selectedName,
      isCorrect: isCorrect,
      timeSpent: _secondsElapsed,
    );

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
        // Вибираємо випадкового покемона як правильну відповідь
        final random = Random();
        final correctIndex = random.nextInt(pokemons.length);
        final correctPokemon = pokemons[correctIndex];

        // Починаємо таймер
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
