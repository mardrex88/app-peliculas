import 'dart:convert';

import 'package:app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '411c0a6d64b43f364012815b33f2e9a0';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> onPopularMovies = [];
  int popularPage = 0;

  Map<int, List<Cast>> movieCast = {};

  MoviesProvider() {
    getOnDisplayMovies();
    getOnPopularMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endPoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(url);

    return response.body;
  }

  getOnDisplayMovies() async {
    final response = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(response);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getOnPopularMovies() async {
    popularPage++;

    final response = await _getJsonData('3/movie/popular', popularPage);

    final popularMoviesResponse = PopularMoviesResponse.fromJson(response);

    onPopularMovies.addAll(popularMoviesResponse.results);

    notifyListeners();
  }

  Future<List<Cast>> getCastingMovie(int movieId) async {
    if (movieCast.containsKey(movieId)) {
      return movieCast[movieId]!;
    }

    final response = await _getJsonData('3/movie/$movieId/credits');

    final creditsMovieResponse = CreditsMovieResponse.fromJson(response);

    movieCast[movieId] = creditsMovieResponse.cast;

    return creditsMovieResponse.cast;
  }
}
