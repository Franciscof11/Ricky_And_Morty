import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ricky_and_morty/characters/data/service/character_service.dart';
import 'package:ricky_and_morty/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () async {
            final CharacterService service = GetIt.I.get();

            // ignore: unused_local_variable
            final response = await service.getCharacters(1);

            // ignore: avoid_print
            print('teste');
          },
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
