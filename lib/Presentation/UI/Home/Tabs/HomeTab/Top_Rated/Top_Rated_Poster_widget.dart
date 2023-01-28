import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Home/Global%20Widgets/Poster_Widget.dart';

class Top_Rated_Poster_widget extends StatelessWidget {
  Movie  movie;
  Top_Rated_Poster_widget({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 15),
      //padding:const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyTheme.DarkGray,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        children: [
          // poster
          Container(
            height: MediaQuery.of(context).size.height >= 732 ? 130 :  90,
            child: Poster_widget(
              movie: movie,
              widthRatio: 0.6,
              Bottom_Left_border_Radius: 0,
              Bottom_Right_border_Radius: 0,
              Top_Right_border_Radius: 5,
              Top_Left_border_Radius: 5,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // rating
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.star_rate_rounded , size: 18 , color: Theme.of(context).primaryColor,),
                      const SizedBox(width: 5,),
                      Text(
                        "${movie.voteAverage!}",
                        style:const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
                // title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${movie.title!}",
                          style:const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      )
                    ],
                  ),
                ),
                // title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${movie.releaseDate!}",
                          style:const TextStyle(
                              color: MyTheme.Gray
                          ),
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
