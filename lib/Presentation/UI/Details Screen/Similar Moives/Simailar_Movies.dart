import 'package:flutter/material.dart';
import '../../../../../DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import '../../GlobalWidgets/Detailed_Poster.dart';

class Similar_Movies extends StatelessWidget {
  List<Movie> Movies;
  Similar_Movies({required this.Movies});

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
            "More Like That",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child:ListView.builder(
              itemBuilder: (context, index) => Detailed_Poster(movie: Movies[index] , buttonAction: test),
              itemCount: Movies.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
  void test(){}
}