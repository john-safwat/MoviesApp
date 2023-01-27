import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';

class BackDropImageWidget extends StatelessWidget {
  Movie movie;
  double height ;
  BackDropImageWidget({required this.movie , required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
              fit: BoxFit.cover
          )
      ),
      child: const Center(
        child: Icon(Icons.play_circle_rounded, size: 60, color: Colors.white,),
      ),
    );
  }
}