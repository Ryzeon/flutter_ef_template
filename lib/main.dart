import 'package:flutter/material.dart';
import 'package:flutter_ef_template/feature/heroes/presentation/pages/favorite_heroes_screen.dart';
import 'package:flutter_ef_template/feature/heroes/presentation/pages/search_heroe_screen.dart';
import 'package:flutter_ef_template/shared/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/search': (context) => const SearchHeroeScreen(),
        '/favorites': (context) => const FavoriteHeroesScreen(),
      },
    );
  }
}
