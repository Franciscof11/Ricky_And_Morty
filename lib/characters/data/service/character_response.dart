import 'package:equatable/equatable.dart';

class CharacterInfoResponse extends Equatable {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  factory CharacterInfoResponse.fromJson(Map<String, dynamic> json) => CharacterInfoResponse(
        count: json['count'],
        pages: json['pages'],
        next: json['next'],
        prev: json['prev'],
      );

  const CharacterInfoResponse({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  @override
  List<Object?> get props => [count, pages, next, prev];
}

class CharacterResponse extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String image;

  const CharacterResponse({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.image,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) => CharacterResponse(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        species: json['species'],
        status: json['status'],
        type: json['type'],
      );

  @override
  List<Object> get props => [id, name, status, species, type, image];
}

class CharacterAPiResponse extends Equatable {
  final CharacterInfoResponse info;
  final List<CharacterResponse> results;

  const CharacterAPiResponse({required this.info, required this.results});

  factory CharacterAPiResponse.fromJson(Map<String, dynamic> json) => CharacterAPiResponse(
        info: CharacterInfoResponse.fromJson(json['info']),
        results: (json['results'] as List<dynamic>).map((character) => CharacterResponse.fromJson(character)).toList(),
      );

  @override
  List<Object?> get props => [info, results];
}
