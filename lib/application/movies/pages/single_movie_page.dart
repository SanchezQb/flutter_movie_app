import 'package:flutter/material.dart';
import 'package:flutter_movie_app/application/movies/models/movie_model.dart';
import 'package:flutter_movie_app/application/movies/widgets/custom_back_button.dart';
import 'package:transparent_image/transparent_image.dart';

class SingleMoviePage extends StatelessWidget {
  final Movie movie;
  SingleMoviePage({this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: movie.id,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: movie.image.medium,
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: AppBar(
                    backgroundColor: Colors.black.withOpacity(0.3),
                    elevation: 0.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.name,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${movie.runtime}min",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.w900, color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ...movie.genres.map(
                    (genre) => Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Chip(
                        label: Text(genre),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(formatText(movie.summary), style: Theme.of(context).textTheme.bodyText1,),
            )
          ],
        ),
      ),
    );
  }

  String formatText(String summary) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    final formatted = summary.replaceAll(exp, '');
    return formatted;
  }
}
