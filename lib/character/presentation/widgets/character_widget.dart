import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_and_morty/character/presentation/bloc/character_bloc.dart';
import 'package:ricky_and_morty/character/presentation/widgets/character_list_tile.dart';
import 'package:ricky_and_morty/shared/theme/data/app_theme.dart';
import 'package:ricky_and_morty/shared/theme/data/application_theme.dart';
import 'package:ricky_and_morty/shared/widgets/default_loading_widget.dart';
import 'package:ricky_and_morty/shared/widgets/default_try_again_widget.dart';

class CharacterWidget extends StatefulWidget {
  const CharacterWidget({super.key});

  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              if (state.result == ResultState.initial || state.result == ResultState.loading && state.isFirstPage) ...{
                const Center(
                  child: DefaultLoadingWidget(),
                )
              } else if (state.result == ResultState.error && state.isFirstPage) ...{
                Center(
                  child: DefaultTryAgainWidget(onPressed: _requestCharacters),
                )
              } else ...{
                Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/logo.png',
                            width: double.infinity,
                            height: 125,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                              itemCount: state.characters.length /* state.hasReachedMax ? state.characters.length : state.characters.length + 1 */,
                              shrinkWrap: true,
                              controller: _scrollController,
                              itemBuilder: (context, index) {
                                final character = state.characters[index];
                                if (index < state.characters.length) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CharacterListTile(character: character),
                                  );
                                } else if (state.result == ResultState.error) {
                                  return DefaultTryAgainWidget(onPressed: _requestCharacters);
                                } else {
                                  return const Center(
                                    child: DefaultLoadingWidget(),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ))
              }
            ],
          ),
        );
      },
    );
  }

  void _onScrollListener() {
    if (_isBottomReached && context.read<CharacterBloc>().state.result != ResultState.error) {
      _requestCharacters();
    }
  }

  bool get _isBottomReached {
    if (!_scrollController.hasClients) {
      return false;
    }

    return _scrollController.offset >= (_scrollController.position.maxScrollExtent * 0.9);
  }

  void _requestCharacters() {
    context.read<CharacterBloc>().add(CharacterRequestEvent());
  }
}
