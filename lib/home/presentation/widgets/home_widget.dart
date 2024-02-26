import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_and_morty/character/presentation/pages/character_page.dart';
import 'package:ricky_and_morty/home/presentation/cubit/navigation_cubit.dart';

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
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: _pages.keys.toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: _pages.values.toList(),
            currentIndex: state,
            onTap: (value) => context.read<NavigationCubit>().onSelectTab(value),
          ),
        );
      },
    );
  }
}
