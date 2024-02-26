import 'package:flutter/material.dart';
import 'package:ricky_and_morty/character/presentation/pages/character_page.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final _pages = {
    //
    //
    const CharacterPage(): const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: 'Characters',
    ),
    //
    //
    const Center(child: Text('Settings Page')): const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _pages.keys.toList(),
      ),
    );
  }
}
