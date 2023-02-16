import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/GlobalWidgets/Detailed_Poster.dart';

import '../../../../../../DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import '../../../../../../DataBase/FireBase/MyDataBase.dart';

class Top_Rated extends StatefulWidget {
  List<Movie> Movies;
  Function buttonAction;

  Top_Rated({required this.Movies, required this.buttonAction});
  @override
  State<Top_Rated> createState() => _Top_RatedState();
}

class _Top_RatedState extends State<Top_Rated> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: 280,
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
                itemBuilder: (context, index) => Detailed_Poster(movie: widget.Movies[index] ,
                    buttonAction: widget.buttonAction),
                itemCount: widget.Movies.length,
                scrollDirection: Axis.horizontal,
              ),
          ),
        ],
      ),
    );
  }
}
