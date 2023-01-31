import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/Presentation/UI/Details%20Screen/Details_Screen.dart';

class Poster_Image extends StatelessWidget {
  Movie movie ;
  double height ;
  double top_Right ;
  double top_Left ;
  double bottom_Right ;
  double bottom_Left ;

  Poster_Image({
    required this.movie,
    required this.height,
    required this.top_Right ,
    required this.top_Left ,
    required this.bottom_Right,
    required this.bottom_Left
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.routeName , arguments: movie);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(top_Left),
              topRight: Radius.circular(top_Right),
              bottomLeft: Radius.circular(bottom_Left),
              bottomRight: Radius.circular(bottom_Right),
            ),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          Image.asset( movie.isInWatchList! ?
            "assets/images/selectedbookmark.png" :
            "assets/images/unselectedbookmark.png"
          )
        ],
      ),
    );
  }
}
