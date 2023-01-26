import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';

class Poster_widget extends StatelessWidget {
  Movie movie ;
  Poster_widget({ required this.movie });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}' ,
          width:  MediaQuery.of(context).size.width *0.25,
        ),
      ],
    );
  }
}
