import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Details%20Screen/Widgets/Movie%20Details/Movie_Details_Widget.dart';
import 'package:movies/Presentation/UI/Details%20Screen/Widgets/Similar%20Moives/Similar_Movies_Widget.dart';

import '../../../Api/Models/Popular_Movies_Models/Results.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'Details Screen';

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)?.settings.arguments as  Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: Column(
          children: [
            Expanded(flex: 4, child: Movie_Details_Widget(movieID: movie.id.toString())),
            Expanded(flex: 2, child: Similar_Movies_Widget(id: movie.id.toString(),))
          ],
      ),
    );
  }
}
