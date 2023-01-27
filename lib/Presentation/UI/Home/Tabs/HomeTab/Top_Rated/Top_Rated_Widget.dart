import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Top_Rated/Top_Rated_Poster_widget.dart';

class Top_Rated_Widget extends StatelessWidget {
  List<Movie> movies;
  Top_Rated_Widget({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical:10),
      padding: const EdgeInsets.all(10),
      color: const Color(0xff282A28),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                "Top Rated Movies",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Top_Rated_Poster_widget(movie: movies[index]),
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );;
  }
}
