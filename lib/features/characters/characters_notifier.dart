import 'package:calibrar/features/characters/characters.dart';
import 'package:calibrar/features/characters/gql.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharactersNotifier extends StateNotifier<CharactersData> {
  CharactersNotifier({required this.repository, required this.ref})
      : super(CharactersData(info: Info(), results: []));

  Ref ref;
  CharacterRemoteSource repository;

  Future<int> getAllCharacter(int page) async {
    final res = await repository.getAllCharacters(page);
    final nextPage = res.info.next;
    final currentPage = nextPage != null ? nextPage - 1 : res.info.pages;

    state = res;

    return currentPage;
  }
}

final charactersNotifierProvider =
    StateNotifierProvider<CharactersNotifier, CharactersData>((ref) {
  final repository = ref.read(characterRemoteSourceDI);
  return CharactersNotifier(repository: repository, ref: ref);
});
