import 'package:injectable/injectable.dart';
import 'package:ricky_and_morty/character/data/service/character_response.dart';
import 'package:ricky_and_morty/character/data/service/character_service.dart';

abstract class CharacterRepository {
  Future<CharacterAPiResponse> getCharacters(int page);
}

@Injectable(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl(this._service);

  final CharacterService _service;

  @override
  Future<CharacterAPiResponse> getCharacters(int page) => _service.getCharacters(page);
}
