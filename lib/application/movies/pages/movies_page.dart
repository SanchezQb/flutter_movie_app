import 'package:flutter/material.dart';
import 'package:flutter_movie_app/application/movies/controllers/movie_controller.dart';
import 'package:flutter_movie_app/application/movies/widgets/movie_widget.dart';
import 'package:get/get.dart';

class MoviesPage extends StatelessWidget {
  final MovieController _movieController = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies App"),
        centerTitle: true,
        actions: [],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(
              () {
                if (_movieController.loading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!_movieController.loading.value &&
                    _movieController.movies.length == 0) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("No Movies"),
                      ],
                    ),
                  );
                }
                return GridView.builder(
                  itemCount: _movieController.movies.length,
                  itemBuilder: (context, index) {
                    return MovieWidget(movie: _movieController.movies[index]);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
