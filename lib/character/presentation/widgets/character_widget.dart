import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_and_morty/character/presentation/bloc/character_bloc.dart';
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
        return Stack(
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
              ListView.builder(
                itemCount: state.hasReachedMax ? state.characters.length : state.characters.length + 1,
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index < state.characters.length) {
                    return InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 200,
                        child: Text(state.characters[index].name),
                      ),
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
            }
          ],
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
