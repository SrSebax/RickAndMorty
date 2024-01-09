import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/providers/api_provider.dart';
import 'package:rickandmortyapp/screens/character_screen.dart';
import 'package:rickandmortyapp/screens/home_screen.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
    GoRoute(
      path: '/character',
      pageBuilder: (context, state) {
        final character = state.extra as Character;
        return MaterialPage(child: CharacterScreen(character: character,));
      }
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ApiProvider(),
        child: MaterialApp.router(
            title: 'Rick And Morty App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              useMaterial3: true,
            ),
            routerConfig: _router));
  }
}
