import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/GlobalWidgets/BackDropImage.dart';
import '../../../../../DataBase/Api/Models/Movie_Details_Model/Movie_Details_Response.dart';
import 'DetailsPosterImage.dart';

class Movie_Details extends StatelessWidget {
  MovieDetailsResponse movie;
  Movie_Details({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackDropImage(image: 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          child: Text(
            movie.title!,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          width: double.infinity,
          child: Text(
            movie.releaseDate!,
            style: const TextStyle(
                color: MyTheme.SmallGaryText,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: DetailsPosterImage(
                    image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          height:60,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 7,
                                    crossAxisSpacing: 7,
                                    childAspectRatio: 2.8),
                            itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: MyTheme.SmallGaryText)),
                                height: 10,
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text(
                                  movie.genres![index].name!,
                                  style: const TextStyle(
                                      color: MyTheme.SmallGaryText,
                                      fontSize: 10),
                                  textAlign: TextAlign.center,
                                )),
                            itemCount: movie.genres!.length,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Text(
                            movie.overview!,
                            style: const TextStyle(color: MyTheme.SmallGaryText),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                color: MyTheme.Gold,
                                size: 24,
                              ),
                              const SizedBox(width: 5,),
                              Text(
                                movie.voteAverage!.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
