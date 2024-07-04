import 'package:calibrar/features/characters/character_list.dart';
import 'package:calibrar/features/characters/character_page.dart';
import 'package:calibrar/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  await initHiveForFlutter();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (ctx, state) => const Home(),
      routes: [
        GoRoute(
          path: "rick-morty",
          builder: (ctx, state) => const CharacterList(),
        ),
        GoRoute(
          path: "rick-morty/:id",
          builder: (ctx, state) {
            return CharacterPage(id: state.pathParameters["id"]);
          },
        )
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final client1 = ValueNotifier(
    GraphQLClient(
      link: HttpLink("http://10.0.2.2:3000/graphql"),
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client1,
      child: MaterialApp.router(
        builder: (ctx, child) => ResponsiveBreakpoints(
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 800, name: TABLET),
            Breakpoint(start: 801, end: 1920, name: DESKTOP),
          ],
          child: child!,
        ),
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
