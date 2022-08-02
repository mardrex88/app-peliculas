import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('Movies Provider Constructor');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    print('Movies Provider getOnDisplayMovies');
  }
}
