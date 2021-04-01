import 'package:flutter/material.dart';
import 'package:flutter_movie_app/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'application/movies/pages/movies_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: MoviesPage(),
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
