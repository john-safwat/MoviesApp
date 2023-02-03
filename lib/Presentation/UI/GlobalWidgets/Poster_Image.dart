import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/FireBase/MyDataBase.dart';
import 'package:movies/Presentation/UI/Details%20Screen/Details_Screen.dart';
import 'package:movies/Presentation/UI/utils/Dialogs_utils_class.dart';

class Poster_Image extends StatefulWidget {
  Movie movie ;
  double height ;
  double top_Right ;
  double top_Left ;
  double bottom_Right ;
  double bottom_Left ;

  Poster_Image({
    required this.movie,
    required this.height,
    required this.top_Right ,
    required this.top_Left ,
    required this.bottom_Right,
    required this.bottom_Left
  });

  @override
  State<Poster_Image> createState() => _Poster_ImageState();
}

class _Poster_ImageState extends State<Poster_Image> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.routeName , arguments: widget.movie);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.top_Left),
              topRight: Radius.circular(widget.top_Right),
              bottomLeft: Radius.circular(widget.bottom_Left),
              bottomRight: Radius.circular(widget.bottom_Right),
            ),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
              height: widget.height,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            onTap: (){
              if(widget.movie.isInWatchList! ){
                DialogUtils.showMessage(
                  message: 'Do You Want to Delete ?',
                  context: context,
                  posActiontitle: 'ok',
                  posAction: () async{
                    widget.movie.isInWatchList = false;
                    DialogUtils.showDialogeMessage(Message: 'deleting....', context: context);
                    await MyDataBase.deletemovie(widget.movie.DataBaseID);
                    DialogUtils.hideDialogMessage(context: context);
                    setState(() {});
                  },
                  nigActiontitle: "Cancle",
                  nigAction: (){}
                );

              }else {
                DialogUtils.showMessage(
                  message: 'Do You Want to Add ?',
                  context: context,
                  posActiontitle: 'ok',
                  posAction: () async{
                    widget.movie.isInWatchList = true;
                    DialogUtils.showDialogeMessage(Message: 'adding....', context: context);
                    await MyDataBase.insertMovieData(widget.movie);
                    DialogUtils.hideDialogMessage(context: context);
                    setState(() {});
                  },
                  nigActiontitle: "Cancle",
                  nigAction: (){}
                );
              }
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
