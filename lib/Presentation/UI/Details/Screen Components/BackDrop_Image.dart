import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';

import '../../../../Api/Models/Movie_Details_Model/Movie_Details_Response.dart';

class BackDropImage extends StatelessWidget {
  MovieDetailsResponse movie;
  BackDropImage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network('https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.width * 0.5,
          child: const Icon(
            Icons.play_circle_rounded,
            color: Colors.white,
            size: 70,
          ),
        )
      ],
    );
  }
}
