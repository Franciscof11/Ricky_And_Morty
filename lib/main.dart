import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:ricky_and_morty/characters/data/service/character_service.dart';

void main() {
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
          onPressed: () {
            final service = CharacterServiceImpl(
              Dio(
                BaseOptions(
                  baseUrl: 'https://rickandmortyapi.com/api/',
                ),
              )..interceptors.add(PrettyDioLogger()),
            );

            service.getCharacters(1);
          },
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
