import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';

import '../../../../Api/Models/Movie_Details_Model/Movie_Details_Response.dart';
import '../../Details/Details_Screeen.dart';

class UnClicable_Poster_widget extends StatelessWidget {
  MovieDetailsResponse movie;

  double widthRatio;
  double Top_Left_border_Radius;
  double Top_Right_border_Radius;
  double Bottom_Left_border_Radius;
  double Bottom_Right_border_Radius;
  UnClicable_Poster_widget({
    required this.movie,
    required this.widthRatio,
    required this.Top_Left_border_Radius,
    required this.Top_Right_border_Radius,
    required this.Bottom_Left_border_Radius,
    required this.Bottom_Right_border_Radius,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Top_Left_border_Radius),
            topRight: Radius.circular(Top_Right_border_Radius),
            bottomLeft: Radius.circular(Bottom_Left_border_Radius),
            bottomRight: Radius.circular(Bottom_Right_border_Radius),
          ),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            width: MediaQuery.of(context).size.width * widthRatio,
            fit: BoxFit.cover,
          ),
        ),
        InkWell(
            onTap: () {},
            child: true
                ? Image.asset('assets/images/selectedbookmark.png')
                : Image.asset('assets/images/unselectedbookmark.png')),
      ],
    );
  }
}
