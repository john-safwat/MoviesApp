import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';

import '../../../DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import '../Details Screen/Details_Screen.dart';

class Display_Widget extends StatelessWidget {

  Movie movie;
  Display_Widget({required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.routeName , arguments: movie);
      },
      child: Container(
        height: 100,
        margin:const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: movie.backdropPath == null ?
                Image.asset('assets/images/gallery.png'):
                ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child:Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            movie.title!,
                            style:const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            movie.releaseDate!.substring(0,4),
                            style:const TextStyle(color: MyTheme.SmallGaryText,),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            movie.overview!,
                            style:const TextStyle(color: MyTheme.SmallGaryText,),
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
