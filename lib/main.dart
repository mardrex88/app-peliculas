import 'package:app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/providers/movies_provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.red,
          appBarTheme: const AppBarTheme(color: Colors.red)),
    );
  }
}
