import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_and_morty/character/presentation/bloc/character_bloc.dart';

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
    return const Placeholder();
  }

  void _onScrollListener() {
    if (_isBottomReached && context.read<CharacterBloc>().state.result != ResultState.error) {
      context.read<CharacterBloc>().add(CharacterRequestEvent());
    }
  }

  bool get _isBottomReached {
    if (!_scrollController.hasClients) {
      return false;
    }

    return _scrollController.offset >= (_scrollController.position.maxScrollExtent * 0.9);
  }
}
