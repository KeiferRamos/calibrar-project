import 'package:calibrar/common/service/gql_service.dart';
import 'package:calibrar/features/characters/characters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CharacterRemoteSource {
  CharacterRemoteSource(GqlService gqlService) : _gqlService = gqlService;

  final GqlService _gqlService;

  Future<CharactersData> getAllCharacters(int page) async {
    try {
      const getAll = r"""
        query Characters($page: Int!) {
          characters(page: $page) {
            info {
              count
              pages
              next
              prev
            }
            results {
              id
              name
              status
              species
              type
              gender
              image
              created
              type
              location {
                id
                name
                dimension
              }
              origin {
                id
                name
                dimension
              }
            }
          }
        }
      """;

      final options = QueryOptions(
        document: gql(getAll),
        variables: {"page": page},
      );

      final response = await _gqlService.client.query(options);

      return CharactersData.fromJson(response.data?["characters"]);
    } on Exception catch (_) {
      return CharactersData(info: Info(), results: []);
    }
  }
}

final characterRemoteSourceDI = Provider((ref) {
  final gqlClient = ref.read(gqlService.notifier);
  return CharacterRemoteSource(gqlClient);
});
