import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Global%20Widgets/BackDrob_Image.dart';

class Popular_Movies extends StatelessWidget {
  List<Movie> Movies ;
  Popular_Movies({required this.Movies});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            BackDrop_Image(
              image: 'https://image.tmdb.org/t/p/w500${Movies[index].backdropPath}',
              height: mediaQuery.height *0.25,
              width: mediaQuery.width)
          ],
        ),
      ),
      itemCount: Movies.length,
      scrollDirection: Axis.horizontal,
      physics:const PageScrollPhysics(),
    );

  }
}
