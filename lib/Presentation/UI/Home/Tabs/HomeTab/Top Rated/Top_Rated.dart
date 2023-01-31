import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Global%20Widgets/Poster_Image.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Top%20Rated/Top_Rated_Poster.dart';
import '../../../../../../Api/Models/Popular_Movies_Models/Results.dart';

class Top_Rated extends StatelessWidget {
  List<Movie> Movies;
  Top_Rated({required this.Movies});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          bottom: 15
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Top Rated",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
              child:ListView.builder(
                itemBuilder: (context, index) => Top_Rated_Poster(movie: Movies[index]),
                itemCount: Movies.length,
                scrollDirection: Axis.horizontal,
              ),
          ),
        ],
      ),
    );
  }
}
