import 'package:flutter/material.dart';
import 'package:flutter_movie_app/application/movies/models/movie_model.dart';
import 'package:get/route_manager.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({this.movie});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Get.toNamed('/single', arguments: movie);
          },
          child: Hero(
            tag: movie.id,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: movie.image.medium,
            ),
          ),
        ),
        footer: GridTileBar(
          title: Text(
            movie.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          subtitle: Text("Runtime ${movie.runtime}min"),
          backgroundColor: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }
}
