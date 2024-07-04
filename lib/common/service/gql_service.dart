import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

class GqlService extends StateNotifier<GraphQLClient> {
  GqlService() : super(_initialState);

  static GraphQLClient get _initialState {
    return GraphQLClient(
      link: HttpLink('https://rickandmortyapi.com/graphql'),
      cache: GraphQLCache(),
    );
  }

  GraphQLClient get client => state;
}

final gqlService = StateNotifierProvider<GqlService, GraphQLClient>((ref) {
  return GqlService();
});
