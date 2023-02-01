import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';

import '../../../../Theme/Theme.dart';
import '../../Details_Screen.dart';

class Similar_Movie_Poster extends StatelessWidget {
  Movie movie;
  Similar_Movie_Poster({required this.movie});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.routeName , arguments: movie);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
                color: MyTheme.DarkGray,
                borderRadius: BorderRadius.circular(5)
            ),
            margin: const EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    const Icon(
                      Icons.star_rate_rounded,
                      size: 18,
                      color: MyTheme.Gold,
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      movie.voteAverage!.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 2,),
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Text(
                        movie.title!.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 2,),
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Text(
                        movie.releaseDate!.toString(),
                        style: const TextStyle(
                          color: MyTheme.SmallGaryText,
                          fontSize: 12,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5,),
              ],
            ),
          ),
          Image.asset( movie.isInWatchList! ?
          "assets/images/selectedbookmark.png" :
          "assets/images/unselectedbookmark.png"
          )
        ],
      ),
    );
  }
}