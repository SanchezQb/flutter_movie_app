import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/application/movies/models/movie_model.dart';
import 'package:flutter_movie_app/services/api_service.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  static final ApiService _apiService = ApiService();
  var loading = false.obs;
  var movies = List<Movie>().obs;

  @override
  void onInit() {
    super.onInit();
    this.getMovies();
  }

  void getMovies() async {
    loading.value = true;
    try {
      final List<Movie> result = await _apiService.getMovies();
      movies.assignAll(result);
      loading.value = false;
    } on DioError catch (e) {
      loading.value = false;
      showError(e.response.statusMessage);
    } on SocketException catch (e) {
      loading.value = false;

      showError(e.message);
    }
  }

  void showError(String message) {
    Get.snackbar(
      "Error",
      message,
      animationDuration: Duration(milliseconds: 500),
      backgroundColor: Color(0xFFEA1B2A),
      isDismissible: true,
      duration: Duration(seconds: 3),
      colorText: Colors.white,
    );
  }
}
