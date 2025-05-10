import 'package:flutter/material.dart';
import 'package:pokemon_task/feature/home/presentation/pages/home_page.dart';
import 'package:pokemon_task/feature/home/presentation/pages/profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;
  bool _showBottomNav = true;

  final List<Widget> _pages = [const HomePage(), const ProfilePage()];

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
                  selectedItemColor: Theme.of(context).primaryColor,
                  unselectedItemColor: Colors.grey,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.videogame_asset),
                      label: 'Game',
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
