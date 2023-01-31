import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Global%20Widgets/BackDrob_Image.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Global%20Widgets/Poster_Image.dart';

class Popular_Movies extends StatelessWidget {
  List<Movie> Movies;
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
                image:
                    'https://image.tmdb.org/t/p/w500${Movies[index].backdropPath}',
                height: mediaQuery.height * 0.25,
                width: mediaQuery.width),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Poster_Image(
                      movie: Movies[index],
                      height: mediaQuery.height * 0.24,
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
                                Movies[index].title!,
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
                                    Movies[index].releaseDate!,
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
      itemCount: Movies.length,
      scrollDirection: Axis.horizontal,
      physics: const PageScrollPhysics(),
    );
  }
}
