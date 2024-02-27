// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ricky_and_morty/giphy/data/gif_repository.dart';

class GifWidget extends StatelessWidget {
  const GifWidget({super.key, required this.characterName});
  final String characterName;

  Future<String> getGifs(String word) async {
    final gifRepository = GifRepository();

    final gif = await gifRepository.getAllGifs(word);

    final gifpath = gif.url;
/* 
    print('# Gif Path');

    print(gifpath); */

    return gifpath;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getGifs(characterName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Se ainda estiver carregando, exibe um indicador de progresso
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Se ocorrer um erro, exibe uma mensagem de erro
          return const Center(child: Text('Erro ao carregar a imagem'));
        } else {
          // Se a requisição for bem-sucedida, exibe a imagem
          return Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.network(
                snapshot.data!, // Link da imagem
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : const CircularProgressIndicator(); // Indicador de progresso enquanto a imagem é carregada
                },
              ),
            ),
          );
        }
      },
    );
  }
}
