import 'package:app/models/models.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar por el argumento que se le pase a la pantalla
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(movie: movie),
                _Overview(movie: movie),
                CastingCards(movie.id!)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        centerTitle: true,
        background: FadeInImage(
          placeholder: AssetImage('assets/img/no-image.jpg'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
                width: 110,
              ),
            ),
            SizedBox(width: 20),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size.width - 190,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style: textTheme.headline5,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                  Text(movie.originalTitle,
                      style: textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                  Row(
                    children: [
                      const Icon(Icons.star_border),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(movie.voteAverage.toString(),
                          style: textTheme.caption),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          movie.overview!,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.justify,
        ));
  }
}
