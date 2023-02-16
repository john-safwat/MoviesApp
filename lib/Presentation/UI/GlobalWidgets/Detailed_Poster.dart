import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Details%20Screen/Details_Screen.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import '../../../DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import '../../../DataBase/FireBase/MyDataBase.dart';
import '../utils/Dialogs_utils_class.dart';

class Detailed_Poster extends StatefulWidget {
  Movie movie;
  Detailed_Poster({required this.movie});

  @override
  State<Detailed_Poster> createState() => _Detailed_PosterState();
}

class _Detailed_PosterState extends State<Detailed_Poster> {
  HomeTabViewModel viewModel = HomeTabViewModel();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.routeName , arguments: widget.movie);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: 120,
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
                  child: CachedNetworkImage(
                    imageUrl: 'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                    imageBuilder: (context, imageProvider) => ClipRRect(
                      borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: MyTheme.Gold,)),
                    errorWidget: (context, url, error) =>const  Icon(Icons.error_outline_rounded , color: Colors.red,),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height *0.23,
                    fit: BoxFit.cover,
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
                      widget.movie.voteAverage!.toString(),
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
                        widget.movie.title!.toString(),
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
                        widget.movie.releaseDate!.toString(),
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
          InkWell(
            onTap: (){
              viewModel.updateWatchList(widget.movie);
            },
            child: Image.asset( widget.movie.isInWatchList! ?
              "assets/images/selectedbookmark.png" :
              "assets/images/unselectedbookmark.png"
            ),
          )
        ],
      ),
    );
  }
}
