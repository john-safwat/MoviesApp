import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Home/Global%20Widgets/Poster_Widget.dart';

import '../../../../../../Api/Models/Popular_Movies_Models/Results.dart';

class Popular_Relsases_Posters extends StatelessWidget {
  List<Movie> movies;
  Popular_Relsases_Posters({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      color: const Color(0xff282A28),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                "Popular Movies",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin:const EdgeInsets.only(right: 15),
                  child: Poster_widget(
                      movie: movies[index],
                      widthRatio: 0.23,
                      Bottom_Left_border_Radius: 5,
                      Bottom_Right_border_Radius: 5,
                      Top_Right_border_Radius: 5,
                      Top_Left_border_Radius: 5,
                    ),
                ),
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
          )),
        ],
      ),
    );
  }
}
