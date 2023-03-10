import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/GlobalWidgets/BackDropImage.dart';
import 'package:movies/Presentation/UI/GlobalWidgets/Poster_Image.dart';

import '../../../../../../DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import '../../../../../../DataBase/FireBase/MyDataBase.dart';


class Popular_Movies extends StatefulWidget {
  List<Movie> Movies;
  Function buttonAction;
  Popular_Movies({required this.Movies , required this.buttonAction});

  @override
  State<Popular_Movies> createState() => _Popular_MoviesState();
}

class _Popular_MoviesState extends State<Popular_Movies> {

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) => Container(
        width: MediaQuery.of(context).size.width,

        child: Stack(
          children: [
            BackDropImage(image: 'https://image.tmdb.org/t/p/w500${widget.Movies[index].backdropPath}',),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Poster_Image(
                    buttonAction: widget.buttonAction,
                    movie: widget.Movies[index],
                    height: mediaQuery.height * 0.26,
                    top_Right: 5,
                    top_Left: 5,
                    bottom_Right: 5,
                    bottom_Left: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                widget.Movies[index].title!,
                                style: const TextStyle(fontSize: 16, color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true,
                              )),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                    widget.Movies[index].releaseDate!,
                                    style: const TextStyle(fontSize: 12, color: MyTheme.SmallGaryText),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: true,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      itemCount: widget.Movies.length,
      scrollDirection: Axis.horizontal,
      physics: const PageScrollPhysics(),
    );
  }

}
