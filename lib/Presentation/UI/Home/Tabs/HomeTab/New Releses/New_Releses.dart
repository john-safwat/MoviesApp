import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/GlobalWidgets/Poster_Image.dart';

import '../../../../../../DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import '../../../../../../DataBase/FireBase/MyDataBase.dart';

class New_Releses extends StatefulWidget {
  List<Movie> Movies;
  Function buttonAction;
  New_Releses({required this.Movies , required this.buttonAction});
  @override
  State<New_Releses> createState() => _New_RelesesState();
}

class _New_RelesesState extends State<New_Releses> {

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: 220,
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
                  buttonAction: widget.buttonAction,
                  movie: widget.Movies[index],
                  height: mediaQuery.height ,
                  top_Right: 5,
                  top_Left: 5,
                  bottom_Right: 5,
                  bottom_Left: 5
                ),
              ),
              itemCount: widget.Movies.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
