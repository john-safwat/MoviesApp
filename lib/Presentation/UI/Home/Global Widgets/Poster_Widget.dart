import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';

import '../../Details/Details_Screeen.dart';

class Poster_widget extends StatelessWidget {
  Movie movie ;
  double widthRatio;
  double Top_Left_border_Radius ;
  double Top_Right_border_Radius ;
  double Bottom_Left_border_Radius ;
  double Bottom_Right_border_Radius ;
  Poster_widget({
    required this.movie,
    required this.widthRatio ,
    required this.Top_Left_border_Radius,
    required this.Top_Right_border_Radius,
    required this.Bottom_Left_border_Radius,
    required this.Bottom_Right_border_Radius,
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
              topLeft: Radius.circular(Top_Left_border_Radius),
              topRight: Radius.circular(Top_Right_border_Radius),
              bottomLeft: Radius.circular(Bottom_Left_border_Radius),
              bottomRight: Radius.circular(Bottom_Right_border_Radius),
            ),
            child: Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}' ,
              width:  MediaQuery.of(context).size.width * widthRatio,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            onTap: (){
            },
            child: movie.isInWatchList!?Image.asset('assets/images/selectedbookmark.png'):Image.asset('assets/images/unselectedbookmark.png')
          ),
        ],
      ),
    );
  }
}
