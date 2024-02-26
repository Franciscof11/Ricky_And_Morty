part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class CharacterRequestEvent extends CharacterEvent {}
