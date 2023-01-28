import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'Details Screen';

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
    );
  }
}
