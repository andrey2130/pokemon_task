import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/feature/game/data/repositories/user_stats_repository_impl.dart';
import 'package:pokemon_task/feature/game/domain/repositories/user_stats_repository.dart';
import 'package:pokemon_task/feature/game/presentation/widgets/game_finished_widget.dart';
import 'package:pokemon_task/feature/game/presentation/widgets/game_widget.dart';
import 'package:pokemon_task/feature/game/presentation/widgets/result_widget.dart';
import 'package:pokemon_task/feature/game/presentation/widgets/start_widget.dart';
import 'package:pokemon_task/feature/game/presentation/bloc/pokemon_game_bloc.dart';
import 'package:pokemon_task/service_locator.dart';
import 'package:pokemon_task/feature/game/presentation/widgets/nav_bar_hider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _currentRound = 0;
  int _totalCorrectAnswers = 0;
  final int _totalRounds = 10;
  bool _gameStarted = false;
  late final UserStatsRepository _statsRepository;

  @override
  void initState() {
    super.initState();
    _statsRepository = UserStatsRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonGameBloc>(),
      child: BlocConsumer<PokemonGameBloc, PokemonGameState>(
        listener: (context, state) {
          if (state is Result) {
            debugPrint('[HomePage Listener] State is Result.');
            if (state.result.isCorrect) {
              _totalCorrectAnswers++;
              debugPrint(
                '[HomePage Listener] Correct answer! _totalCorrectAnswers incremented to: $_totalCorrectAnswers',
              );
            } else {
              debugPrint('[HomePage Listener] Incorrect answer.');
            }
            debugPrint(
              '[HomePage Listener] Current round before saving stats: $_currentRound',
            );
            debugPrint(
              '[HomePage Listener] Calling _saveUserStats with streak: ${state.streak}, isCorrect: ${state.result.isCorrect}',
            );
            _saveUserStats(state.streak, state.result.isCorrect);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Who\'s That Pokémon?'),
              actions:
                  _gameStarted
                      ? [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              'Round: $_currentRound/$_totalRounds',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ]
                      : null,
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, PokemonGameState state) {
    if (state is Initial) {
      debugPrint(
        '[HomePage _buildBody] State is Initial. Building StartScreen.',
      );
      return _buildStartScreen(context);
    } else if (state is Loading) {
      debugPrint('[HomePage _buildBody] State is Loading.');
      return const Center(child: CircularProgressIndicator.adaptive());
    } else if (state is Error) {
      debugPrint('[HomePage _buildBody] State is Error: ${state.message}');
      return Center(child: Text('Error: ${state.message}'));
    } else if (state is InProgress) {
      debugPrint(
        '[HomePage _buildBody] State is InProgress. Current round: $_currentRound, Streak: ${state.streak}',
      );
      _gameStarted = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _hideBottomNavigationBar(context);
      });

      return GameWidget(
        pokemons: state.pokemons,
        correctPokemon: state.correctPokemon,
        secondsLeft: state.secondsLeft,
        streak: state.streak,
        currentRound: _currentRound,
        totalRounds: _totalRounds,
      );
    } else if (state is Result) {
      debugPrint(
        '[HomePage _buildBody] State is Result. Current round: $_currentRound, Total rounds: $_totalRounds',
      );
      debugPrint(
        '[HomePage _buildBody] Result details: Correct Pokemon: ${state.result.correctPokemon.name}, Selected: ${state.result.selectedName}, IsCorrect: ${state.result.isCorrect}, Streak: ${state.streak}',
      );

      if (_currentRound >= _totalRounds) {
        debugPrint(
          '[HomePage _buildBody] Last round completed. Building GameFinishedScreen.',
        );
        return _buildGameFinishedScreen(context);
      }

      debugPrint(
        '[HomePage _buildBody] Not the last round. Building ResultWidget for round: $_currentRound',
      );
      return ResultWidget(
        result: state.result,
        streak: state.streak,
        currentRound: _currentRound,
        totalRounds: _totalRounds,
        onNextRound: () {
          setState(() {
            _currentRound++;
          });
          context.read<PokemonGameBloc>().add(
            const PokemonGameEvent.startNewRound(),
          );
        },
        onViewResults: () {
          setState(() {
            _gameStarted = false;
          });
          _showBottomNavigationBar(context);
        },
      );
    }

    return const Center(child: Text('Unknown state'));
  }

  Widget _buildStartScreen(BuildContext context) {
    debugPrint(
      '[HomePage _buildStartScreen] Resetting game state: _currentRound = 0, _totalCorrectAnswers = 0',
    );
    _currentRound = 0;
    _totalCorrectAnswers = 0;
    _gameStarted = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomNavigationBar(context);
    });

    return StartWidget(
      totalRounds: _totalRounds,
      onStartGame: () {
        _currentRound = 1;
        _gameStarted = true;
        context.read<PokemonGameBloc>().add(const PokemonGameEvent.startGame());
      },
    );
  }

  Widget _buildGameFinishedScreen(BuildContext context) {
    debugPrint(
      '[HomePage _buildGameFinishedScreen] Building. Final _totalCorrectAnswers: $_totalCorrectAnswers, _currentRound: $_currentRound',
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomNavigationBar(context);

      _saveCompletedGameStats();
    });

    return GameFinishedWidget(
      correctAnswers: _totalCorrectAnswers,
      totalRounds: _totalRounds,
      onPlayAgain: () {
        _currentRound = 0;
        _totalCorrectAnswers = 0;
        _gameStarted = false;
        context.read<PokemonGameBloc>().add(const PokemonGameEvent.startGame());
      },
    );
  }

  void _hideBottomNavigationBar(BuildContext context) {
    final navBarHider = NavBarHider.of(context);
    if (navBarHider != null) {
      navBarHider.hideNavBar();
    }
  }

  void _showBottomNavigationBar(BuildContext context) {
    final navBarHider = NavBarHider.of(context);
    if (navBarHider != null) {
      navBarHider.showNavBar();
    }
  }

  Future<void> _saveUserStats(int streak, bool isCorrect) async {
    debugPrint(
      '[HomePage _saveUserStats] Attempting to save stats. Streak: $streak, IsCorrect: $isCorrect',
    );
    await _statsRepository.updateStats(
      streak,
      isCorrect,
      incrementTotalAnswers: true,
    );
  }

  Future<void> _saveCompletedGameStats() async {
    debugPrint(
      '[HomePage _saveCompletedGameStats] Attempting to increment games played.',
    );
    await _statsRepository.incrementGamesPlayed();
  }
}
