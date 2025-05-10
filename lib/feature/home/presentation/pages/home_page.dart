import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/feature/home/data/repositories/user_stats_repository_impl.dart';
import 'package:pokemon_task/feature/home/domain/repositories/user_stats_repository.dart';
import 'package:pokemon_task/feature/home/presentation/screens/game_finished_screen.dart';
import 'package:pokemon_task/feature/home/presentation/screens/game_screen.dart';
import 'package:pokemon_task/feature/home/presentation/screens/result_screen.dart';
import 'package:pokemon_task/feature/home/presentation/screens/start_screen.dart';
import 'package:pokemon_task/feature/pokemon/presentation/bloc/pokemon_game_bloc.dart';
import 'package:pokemon_task/service_locator.dart';

/// Page that hosts the pokemon guessing game
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            if (state.result.isCorrect) {
              _totalCorrectAnswers++;
            }

            if (_currentRound < _totalRounds) {
              _currentRound++;
            }
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
      return _buildStartScreen(context);
    } else if (state is Loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is Error) {
      return Center(child: Text('Error: ${state.message}'));
    } else if (state is InProgress) {
      _gameStarted = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _hideBottomNavigationBar(context);
      });

      return GameScreen(
        pokemons: state.pokemons,
        correctPokemon: state.correctPokemon,
        secondsLeft: state.secondsLeft,
        streak: state.streak,
        currentRound: _currentRound,
        totalRounds: _totalRounds,
      );
    } else if (state is Result) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _saveUserStats(state.streak, state.result.isCorrect);
      });

      if (_currentRound >= _totalRounds) {
        return _buildGameFinishedScreen(context);
      }

      return ResultScreen(
        result: state.result,
        streak: state.streak,
        currentRound: _currentRound,
        totalRounds: _totalRounds,
        onNextRound: () {
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
    _currentRound = 0;
    _totalCorrectAnswers = 0;
    _gameStarted = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomNavigationBar(context);
    });

    return StartScreen(
      totalRounds: _totalRounds,
      onStartGame: () {
        _currentRound = 1;
        _gameStarted = true;
        context.read<PokemonGameBloc>().add(const PokemonGameEvent.startGame());
      },
    );
  }

  Widget _buildGameFinishedScreen(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomNavigationBar(context);
      if (_currentRound == _totalRounds) {
        _statsRepository.updateStats(0, false, incrementTotalAnswers: true);
      }
      _saveCompletedGameStats();
    });

    return GameFinishedScreen(
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
    await _statsRepository.updateStats(
      streak,
      isCorrect,
      incrementTotalAnswers: true,
    );
  }

  Future<void> _saveCompletedGameStats() async {
    await _statsRepository.incrementGamesPlayed();
  }
}

class NavBarHider extends InheritedWidget {
  final VoidCallback hideNavBar;
  final VoidCallback showNavBar;

  const NavBarHider({
    Key? key,
    required this.hideNavBar,
    required this.showNavBar,
    required Widget child,
  }) : super(key: key, child: child);

  static NavBarHider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NavBarHider>();
  }

  @override
  bool updateShouldNotify(NavBarHider oldWidget) {
    return hideNavBar != oldWidget.hideNavBar ||
        showNavBar != oldWidget.showNavBar;
  }
}
