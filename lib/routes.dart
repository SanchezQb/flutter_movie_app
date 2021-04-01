import 'package:flutter/material.dart';
import 'package:flutter_movie_app/application/movies/pages/movies_page.dart';

import 'application/errors/route_error_page.dart';
import 'application/movies/models/movie_model.dart';
import 'application/movies/pages/single_movie_page.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => MoviesPage(),
        );
      case '/single':
        final Movie movie = settings.arguments;
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => SingleMoviePage(movie: movie),
        );
      default:
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => RouteErrorPage(),
        );
    }
  }
}
