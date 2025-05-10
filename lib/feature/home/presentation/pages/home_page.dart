import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/game_result.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_task/feature/pokemon/presentation/bloc/pokemon_game_bloc.dart';
import 'package:pokemon_task/service_locator.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonGameBloc>(),
      child: BlocConsumer<PokemonGameBloc, PokemonGameState>(
        listener: (context, state) {
          if (state is Result) {
            // Оновлюємо статистику гри
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
      // Гра в процесі
      _gameStarted = true;
      // Приховуємо нижню навігацію при старті гри
      WidgetsBinding.instance.addPostFrameCallback((_) {
        hideBottomNavigationBar(context);
      });

      return _buildGameScreen(
        context,
        state.pokemons,
        state.correctPokemon,
        state.secondsLeft,
        state.streak,
      );
    } else if (state is Result) {
      // Перевіряємо чи закінчились раунди
      if (_currentRound >= _totalRounds) {
        return _buildGameFinishedScreen(context);
      }

      return _buildResultScreen(context, state.result, state.streak);
    }

    return const Center(child: Text('Unknown state'));
  }

  void hideBottomNavigationBar(BuildContext context) {
    // Приховуємо нижню навігацію коли гра почалась
    final navBarHider = NavBarHider.of(context);
    if (navBarHider != null) {
      navBarHider.hideNavBar();
    }
  }

  void showBottomNavigationBar(BuildContext context) {
    // Показуємо нижню навігацію коли гра закінчилась
    final navBarHider = NavBarHider.of(context);
    if (navBarHider != null) {
      navBarHider.showNavBar();
    }
  }

  Widget _buildStartScreen(BuildContext context) {
    _currentRound = 0;
    _totalCorrectAnswers = 0;
    _gameStarted = false;

    // Показуємо нижню навігацію на стартовому екрані
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBottomNavigationBar(context);
    });

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to Pokémon Quiz!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Test your Pokémon knowledge by guessing the silhouettes.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            'Complete all $_totalRounds rounds to test your knowledge!',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              _currentRound = 1; // Починаємо перший раунд
              _gameStarted = true;
              context.read<PokemonGameBloc>().add(
                const PokemonGameEvent.startGame(),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            ),
            child: const Text('Start Game', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  Widget _buildGameScreen(
    BuildContext context,
    List<PokemonEntity> pokemons,
    PokemonEntity correctPokemon,
    int secondsLeft,
    int streak,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Лічильник стріку та таймер
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      color: Colors.orangeAccent,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Streak: $streak',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color:
                      secondsLeft < 10
                          ? Colors.red.shade100
                          : Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      color: secondsLeft < 10 ? Colors.red : Colors.green,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$secondsLeft s',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Силует покемона - покращений, не повністю чорний
          Expanded(
            child: Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: correctPokemon.imageUrl,
                        placeholder:
                            (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    Positioned.fill(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.indigo.withOpacity(0.85),
                          BlendMode.modulate,
                        ),
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Питання
          const Text(
            'Who\'s That Pokémon?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          // Варіанти відповідей
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return ElevatedButton(
                  onPressed: () {
                    context.read<PokemonGameBloc>().add(
                      PokemonGameEvent.makeGuess(pokemon.name),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _formatPokemonName(pokemon.name),
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultScreen(
    BuildContext context,
    GameResult result,
    int streak,
  ) {
    final correctPokemon = result.correctPokemon;
    final isCorrect = result.isCorrect;

    // Зберігаємо статистику користувача
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _saveUserStats(streak, isCorrect);
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Лічильник раундів
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.sports_score, color: Colors.blue.shade800),
                const SizedBox(width: 8),
                Text(
                  'Round $_currentRound of $_totalRounds',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Відображення стріку
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.local_fire_department,
                  color: Colors.orangeAccent,
                ),
                const SizedBox(width: 8),
                Text(
                  'Current Streak: $streak',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Результат (правильно/неправильно)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: isCorrect ? Colors.green.shade100 : Colors.red.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              isCorrect
                  ? 'You caught it! 🎉'
                  : 'Oops! It was ${_formatPokemonName(correctPokemon.name)} 😅',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isCorrect ? Colors.green.shade800 : Colors.red.shade800,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Картинка покемона
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: correctPokemon.imageUrl,
                    height: 200,
                    placeholder:
                        (context, url) => const CircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _formatPokemonName(correctPokemon.name),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Типи покемона
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        correctPokemon.types.map((type) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _getTypeColor(type),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              type.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 16),
                  // Характеристики покемона
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('HP', correctPokemon.stats.hp),
                      _buildStatColumn('ATK', correctPokemon.stats.attack),
                      _buildStatColumn('DEF', correctPokemon.stats.defense),
                      _buildStatColumn('SPD', correctPokemon.stats.speed),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn(
                        'SP.ATK',
                        correctPokemon.stats.specialAttack,
                      ),
                      _buildStatColumn(
                        'SP.DEF',
                        correctPokemon.stats.specialDefense,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Кнопка наступного раунду або завершення гри
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_currentRound < _totalRounds) {
                  context.read<PokemonGameBloc>().add(
                    const PokemonGameEvent.startNewRound(),
                  );
                } else {
                  // Всі раунди пройдені, оновлюємо UI щоб показати кінцевий результат
                  setState(() {
                    _gameStarted = false;
                  });

                  // Показуємо нижню навігацію знову
                  showBottomNavigationBar(context);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor:
                    _currentRound < _totalRounds
                        ? Theme.of(context).primaryColor
                        : Colors.green,
              ),
              child: Text(
                _currentRound < _totalRounds ? 'Next Round' : 'View Results',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameFinishedScreen(BuildContext context) {
    // Показуємо нижню навігацію знову
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBottomNavigationBar(context);
      // Зберігаємо статистику завершеної гри
      _saveCompletedGameStats();
    });

    final score = (_totalCorrectAnswers / _totalRounds * 100).toInt();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Game Finished!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Your Score: $score%',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: _getScoreColor(score),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Correct Answers: $_totalCorrectAnswers out of $_totalRounds',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                Text(
                  _getScoreMessage(score),
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Починаємо нову гру
              _currentRound = 0;
              _totalCorrectAnswers = 0;
              _gameStarted = false;
              context.read<PokemonGameBloc>().add(
                const PokemonGameEvent.startGame(),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              backgroundColor: Colors.green,
            ),
            child: const Text('Play Again', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  String _getScoreMessage(int score) {
    if (score >= 90) {
      return 'Amazing! You are a true Pokémon Master!';
    } else if (score >= 70) {
      return 'Great job! You know your Pokémon well!';
    } else if (score >= 50) {
      return 'Good effort! Keep training to become a Pokémon Master!';
    } else {
      return 'Keep practicing! Every Pokémon Master starts somewhere!';
    }
  }

  Color _getScoreColor(int score) {
    if (score >= 90) {
      return Colors.purple;
    } else if (score >= 70) {
      return Colors.green.shade700;
    } else if (score >= 50) {
      return Colors.amber.shade700;
    } else {
      return Colors.red.shade700;
    }
  }

  Widget _buildStatColumn(String label, int value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _formatPokemonName(String name) {
    // Форматуємо ім'я покемона (перша буква велика, прибираємо дефіси)
    return name
        .split('-')
        .map((part) => part.substring(0, 1).toUpperCase() + part.substring(1))
        .join(' ');
  }

  Color _getTypeColor(String type) {
    // Повертаємо колір для типу покемона
    switch (type.toLowerCase()) {
      case 'normal':
        return Colors.grey.shade500;
      case 'fire':
        return Colors.red.shade600;
      case 'water':
        return Colors.blue.shade600;
      case 'electric':
        return Colors.amber.shade500;
      case 'grass':
        return Colors.green.shade600;
      case 'ice':
        return Colors.cyan.shade300;
      case 'fighting':
        return Colors.brown.shade600;
      case 'poison':
        return Colors.purple.shade600;
      case 'ground':
        return Colors.amber.shade800;
      case 'flying':
        return Colors.indigo.shade300;
      case 'psychic':
        return Colors.pink.shade400;
      case 'bug':
        return Colors.lightGreen.shade700;
      case 'rock':
        return Colors.amber.shade700;
      case 'ghost':
        return Colors.purple.shade800;
      case 'dragon':
        return Colors.indigo.shade600;
      case 'dark':
        return Colors.grey.shade800;
      case 'steel':
        return Colors.blueGrey.shade400;
      case 'fairy':
        return Colors.pink.shade300;
      default:
        return Colors.grey.shade500;
    }
  }

  Future<void> _saveUserStats(int streak, bool isCorrect) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      final userDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid);

      // Отримуємо поточні дані користувача
      final userData = await userDoc.get();

      // Ініціалізуємо значення за замовчуванням
      int currentBestStreak = 0;
      int correctAnswers = 0;

      // Якщо документ існує, отримуємо поточні значення
      if (userData.exists) {
        final data = userData.data() as Map<String, dynamic>;
        currentBestStreak = data['bestStreak'] ?? 0;
        correctAnswers = data['correctAnswers'] ?? 0;
      }

      // Оновлюємо статистику
      final newBestStreak =
          streak > currentBestStreak ? streak : currentBestStreak;

      // Зберігаємо оновлені дані
      await userDoc.set({
        'bestStreak': newBestStreak,
        'correctAnswers': correctAnswers + (isCorrect ? 1 : 0),
        'lastPlayed': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error saving user stats: $e');
    }
  }

  // Новий метод для збереження статистики завершеної гри
  Future<void> _saveCompletedGameStats() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      final userDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid);

      // Отримуємо поточні дані користувача
      final userData = await userDoc.get();

      // Ініціалізуємо значення за замовчуванням
      int gamesPlayed = 0;

      // Якщо документ існує, отримуємо поточні значення
      if (userData.exists) {
        final data = userData.data() as Map<String, dynamic>;
        gamesPlayed = data['gamesPlayed'] ?? 0;
      }

      // Зберігаємо оновлені дані - збільшуємо лічильник завершених ігор на 1
      await userDoc.set({
        'gamesPlayed': gamesPlayed + 1,
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error saving completed game stats: $e');
    }
  }
}

// Інтерфейс для показу/приховання нижньої навігації
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
