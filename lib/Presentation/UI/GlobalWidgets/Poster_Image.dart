import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Details%20Screen/Details_Screen.dart';
import '../../../DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import '../../Theme/Theme.dart';

class Poster_Image extends StatefulWidget{
  Movie movie ;
  double height ;
  double top_Right ;
  double top_Left ;
  double bottom_Right ;
  double bottom_Left ;
  Function buttonAction;

  Poster_Image({
    required this.movie,
    required this.height,
    required this.top_Right ,
    required this.top_Left ,
    required this.bottom_Right,
    required this.bottom_Left,
    required this.buttonAction
  });

  @override
  State<Poster_Image> createState() => _Poster_ImageState();
}

class _Poster_ImageState extends State<Poster_Image>{

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, DetailsScreen.routeName , arguments: widget.movie);
        },
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
              imageBuilder: (context, imageProvider) =>ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.top_Left),
                  topRight: Radius.circular(widget.top_Right),
                  bottomLeft: Radius.circular(widget.bottom_Left),
                  bottomRight: Radius.circular(widget.bottom_Right),
                ),
                child: Image.network('https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',),
              ),
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: MyTheme.Gold,)),
              errorWidget: (context, url, error) =>const  Icon(Icons.error_outline_rounded , color: Colors.red,),
              height: widget.height,
              fit: BoxFit.cover,
            ),

            InkWell(
              onTap: (){
                widget.buttonAction(widget.movie);
              },
              child:Image.asset( widget.movie.isInWatchList! ?
                "assets/images/selectedbookmark.png" :
                "assets/images/unselectedbookmark.png"
              ),
            )
          ],
        ),
    );
  }

}
