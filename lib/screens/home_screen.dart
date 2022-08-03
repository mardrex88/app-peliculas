import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:app/widgets/widgets.dart';
import 'package:app/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en Cine'),
          backgroundColor: Colors.lightGreen,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                //   showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
              ),
              MovieSlider(
                movies: moviesProvider.onPopularMovies,
                titleWidget: 'Populares!',
              ),
            ],
          ),
        ));
  }
}
