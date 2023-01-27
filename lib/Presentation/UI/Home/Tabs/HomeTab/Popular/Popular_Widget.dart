import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Home/Global%20Widgets/BackDrop_Image_Widget.dart';
import 'package:movies/Presentation/UI/Home/Global%20Widgets/Poster_Widget.dart';

class Popular_Widget extends StatelessWidget {
  Movie movie;
  Popular_Widget({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          BackDropImageWidget(movie: movie , height: 0.22,),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.33 ,
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.all(15),
                child: Poster_widget(
                  movie: movie,
                  widthRatio: 0.33 ,
                  Bottom_Left_border_Radius: 5,
                  Bottom_Right_border_Radius: 5,
                  Top_Right_border_Radius: 5,
                  Top_Left_border_Radius: 5,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        movie.title!,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        movie.releaseDate!,
                        style: const TextStyle(fontSize: 12, color: MyTheme.SmallGaryText ,),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
