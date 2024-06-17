import 'package:anime_fever/screens/anime_screen.dart';
import 'package:anime_fever/screens/category.dart';
import 'package:anime_fever/screens/search.dart';
import 'package:anime_fever/screens/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final _destinations = [
    const NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const NavigationDestination(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const NavigationDestination(
      icon: Icon(Icons.category),
      label: 'Category',
    ),
    const NavigationDestination(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  final _screens = [
    const AnimeScreen(),
    const SearchScreen(),
    const CategoryScreen(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: _destinations,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
