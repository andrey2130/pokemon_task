import 'package:flutter/material.dart';

/// Inherited widget that provides methods to show/hide the navigation bar
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
