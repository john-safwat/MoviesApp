import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Global%20Widgets/Poster_Image.dart';
import '../../../../../../Api/Models/Popular_Movies_Models/Results.dart';

class New_Releses extends StatelessWidget {
  List<Movie> Movies;
  New_Releses({required this.Movies});

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
            "New Releases",
            style: TextStyle(
                color: Colors.white, 
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                margin:const EdgeInsets.only(right: 15),
                child: Poster_Image(
                    movie: Movies[index],
                    height: mediaQuery.height,
                    top_Right: 5,
                    top_Left: 5,
                    bottom_Right: 5,
                    bottom_Left: 5
                ),
              ),
              itemCount: Movies.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
