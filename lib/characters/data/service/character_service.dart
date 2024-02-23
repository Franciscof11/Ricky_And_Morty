// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

abstract class CharacterService {
  Future<void> getCharacters([int page = 1]);
}

class CharacterServiceImpl implements CharacterService {
  CharacterServiceImpl(this._client);

  final Dio _client;

  @override
  Future<void> getCharacters([int page = 1]) async {
    final response = await _client.get(
      'character',
      queryParameters: {
        'page': '$page',
      },
    );
    print('#Status Code -> ${response.statusCode}');
    print('#Response -> ${response.data}');
  }
}
