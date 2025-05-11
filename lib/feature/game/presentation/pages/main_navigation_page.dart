import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_task/feature/game/presentation/pages/home_page.dart';
import 'package:pokemon_task/feature/profile/presentation/pages/profile_page.dart';
import 'package:pokemon_task/feature/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import 'package:pokemon_task/feature/leaderboard/presentation/pages/leaderboard_page.dart';
import 'package:pokemon_task/feature/game/presentation/widgets/nav_bar_hider.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;
  bool _showBottomNav = true;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const GamePage(),
      BlocProvider<LeaderboardBloc>(
        create: (context) => GetIt.instance<LeaderboardBloc>(),
        child: const LeaderboardPage(),
      ),
      const ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _hideNavigationBar() {
    setState(() {
      _showBottomNav = false;
    });
  }

  void _showNavigationBar() {
    setState(() {
      _showBottomNav = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavBarHider(
      hideNavBar: _hideNavigationBar,
      showNavBar: _showNavigationBar,
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar:
            _showBottomNav
                ? BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.videogame_asset),
                      label: 'Game',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.leaderboard),
                      label: 'Leaderboard',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                )
                : null,
      ),
    );
  }
}
