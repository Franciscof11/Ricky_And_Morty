import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ricky_and_morty/giphy/domain/gif.dart';

class GifRepository {
  getAllGifs(String word) async {
    //

    //

    try {
      final response = await Dio().get(
        'https://api.giphy.com/v1/stickers/search',
        queryParameters: {
          'api_key': 'NxfpSBVW76TGs1pX2dBccSMeIZty5kqN',
          'q': word,
          'limit': 1,
        },
      );

      if (response.statusCode == 200) {
        print('# AQUIIII');
        print(response.data['data'][0]['images']['original']['url']);
        return Gif.fromJson(response.data['data'][0]['images']['original']['url']);
      }
    } catch (e) {
      throw HttpException('Error: $e');
    }
  }
}
