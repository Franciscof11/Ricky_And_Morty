import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ricky_and_morty/character/data/service/character_response.dart';

abstract class CharacterService {
  Future<CharacterAPiResponse> getCharacters([int page = 1]);
}

@Injectable(as: CharacterService)

//
class CharacterServiceImpl implements CharacterService {
  CharacterServiceImpl(this._client);

  final Dio _client;

  @override
  Future<CharacterAPiResponse> getCharacters([int page = 1]) async {
    final response = await _client.get(
      'character',
      queryParameters: {
        'page': '$page',
      },
    );

    if (response.statusCode == 200) {
      return CharacterAPiResponse.fromJson(response.data);
    }

    throw HttpException('Fail to get characters at page: $page');
  }
}
