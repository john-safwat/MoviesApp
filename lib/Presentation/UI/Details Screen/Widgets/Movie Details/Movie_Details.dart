import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Movie_Details_Model/Movie_Details_Response.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Global%20Widgets/BackDrob_Image.dart';

class Movie_Details extends StatelessWidget {
  MovieDetailsResponse movie ;
  Movie_Details({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
