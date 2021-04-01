import 'package:dio/dio.dart';
import 'package:flutter_movie_app/application/movies/models/movie_model.dart';
import 'package:flutter_movie_app/constants/constants.dart';

class ApiService {
  static BaseOptions options = new BaseOptions(
    baseUrl: kBaseUrl,
  );

  Dio dio = new Dio(options);

  Future<List<Movie>> getMovies() async {
    Response response = await dio.get("$kBaseUrl/shows");
    final payload = response.data as List;
    final data = payload.map((movie) => Movie.fromJson(movie));

    return data.toList();
  }

  // Future<Movie> getMovie({@required String id}) async {
  //   Response response = await dio.get("$kBaseUrl/shows/$id");
  //   final payload = response.data;
  //   final data = Movie.fromJson(payload);
  //   return data;
  // }
}
