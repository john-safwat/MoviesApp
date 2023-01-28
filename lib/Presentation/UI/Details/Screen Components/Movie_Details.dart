import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Details/Screen%20Components/BackDrop_Image.dart';
import 'package:movies/Presentation/UI/Details/Screen%20Components/PosterWidget.dart';

import '../../../../Api/Models/Movie_Details_Model/Movie_Details_Response.dart';

class Movie_Details extends StatelessWidget {
  MovieDetailsResponse movie;

  Movie_Details({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackDropImage(movie: movie),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                movie.title!,
                style: const TextStyle(
                  color: Colors.white ,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              const SizedBox(height: 8,),
              Text(
                movie.releaseDate!,
                style: const TextStyle(
                    color: MyTheme.Gray,
                    fontSize: 14
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  flex :2 ,
                    child: UnClicable_Poster_widget(
                      movie: movie,
                      Bottom_Left_border_Radius: 5,
                      Bottom_Right_border_Radius: 5,
                      Top_Right_border_Radius: 5,
                      Top_Left_border_Radius: 5,
                      widthRatio: 0.34,
                    )
                ),
                Expanded(
                    flex :3 ,
                    child:Container(

                    )
                ),
              ],
            ),
          )
        ),
      ],
    );
  }
}
