import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Details%20Screen/Details_Screen.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/HomeTeabNavigator.dart';
import 'package:movies/Presentation/UI/utils/Dialogs_utils_class.dart';
import 'package:provider/provider.dart';

import '../../../DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import '../../../DataBase/FireBase/MyDataBase.dart';
import '../../Theme/Theme.dart';

class Poster_Image extends StatefulWidget{
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

class _Poster_ImageState extends State<Poster_Image>  implements HomeTabNavigator{
  HomeTabViewModel viewModel = HomeTabViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    viewModel.navigator = null;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: InkWell(
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
                viewModel.updateWatchList(widget.movie);
              },
              child:Image.asset( widget.movie.isInWatchList! ?
                "assets/images/selectedbookmark.png" :
                "assets/images/unselectedbookmark.png"
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void goToDetailsScreen() {
  }

  @override
  void hideLoading() {
    DialogUtils.hideDialogMessage(context: context);
  }

  @override
  void showLoading(String message) {
    DialogUtils.showDialogeMessage(Message: message, context: context);
  }

  @override
  void showMessage(String message) {
    DialogUtils.showMessage(message: message, context: context);
  }
}
