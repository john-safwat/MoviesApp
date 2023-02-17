import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movies/DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/HomeTeabNavigator.dart';
import '../../../../../DataBase/Api/ApiManager/Api_Manager.dart';
import '../../../../../DataBase/FireBase/MyDataBase.dart';

class HomeTabViewModel extends ChangeNotifier {
  HomeTabNavigator? navigator;
  Api_Manager Api = Api_Manager();
  List<Movie>? popularMovies ;
  List<Movie>? newReleaseMovies ;
  List<Movie>? topRatedMovies ;
  String? errorMessage ;

  // function to call the api to get the popular movies
  void getPoplarMovies() async {
    popularMovies = null ;
    errorMessage = null ;
    try {
      var response = await Api.Get_Popular_Movies();
      List<Movie> watchlist =  await MyDataBase.getMoviesToCompare();
      popularMovies = response.results! ;
      for(int i = 0 ; i<popularMovies!.length ;i++){
        for(int j=0;j<watchlist.length ; j++){
          if(popularMovies![i].id.toString() == watchlist[j].id.toString()){
            popularMovies![i].isInWatchList = true;
            popularMovies![i].DataBaseID = watchlist[j].DataBaseID;
          }
        }
      }
    } on HttpException catch(e){
      errorMessage =  "Connection To Server Error\n${e.toString()}";
    } on IOException catch(e){
      errorMessage =  "I/O Error \n${e.toString()}";
    } catch(e) {
      errorMessage = "UnKnown Error \n${e.toString()}";
    }
    notifyListeners();
  }
  // function to call the api to get the new releases movies
  void getNewReleaseMovies() async {
    newReleaseMovies = null ;
    errorMessage = null ;
    try {
      var response = await Api.Get_Popular_Movies();
      List<Movie> watchlist =  await MyDataBase.getMoviesToCompare();
      newReleaseMovies = response.results! ;
      for (int i =0  ; i< watchlist.length ; i++ ){
        for (int j = 0 ; j< newReleaseMovies!.length ; j++){
          if (watchlist[i].id.toString() == newReleaseMovies![j].id.toString()){
            newReleaseMovies![j].isInWatchList = true;
            newReleaseMovies![j].DataBaseID = watchlist[i].DataBaseID;
          }
        }
      }
    } on HttpException catch(e){
      errorMessage =  "Connection To Server Error\n${e.toString()}";
    } on IOException catch(e){
      errorMessage =  "I/O Error \n${e.toString()}";
    } catch(e) {
      errorMessage = "UnKnown Error \n${e.toString()}";
    }
    notifyListeners();
  }
  // function to call the api to get the top rated movies
  void getTopRatedMovies() async {
    topRatedMovies = null ;
    errorMessage = null ;
    try {
      var response = await Api.Get_Top_Rated_Movies();
      List<Movie> watchlist =  await MyDataBase.getMoviesToCompare();
      topRatedMovies = response.results! ;
      for (int i =0  ; i< watchlist.length ; i++ ){
        for (int j = 0 ; j< topRatedMovies!.length ; j++){
          if (watchlist[i].id.toString() == topRatedMovies![j].id.toString()){
            topRatedMovies![j].isInWatchList = true ;
            topRatedMovies![j].DataBaseID = watchlist[i].DataBaseID;
          }
        }
      }
    } on HttpException catch(e){
      errorMessage =  "Connection To Server Error\n${e.toString()}";
    } on IOException catch(e){
      errorMessage =  "I/O Error \n${e.toString()}";
    } catch(e) {
      errorMessage = "UnKnown Error \n${e.toString()}";
    }
    notifyListeners();
  }

  // function to update the watchlist
  void updateWatchList(Movie movie) async{
    if (movie.isInWatchList!){
      navigator?.showMessage(
        "Do You Want To Delete ?",
        nigActionTitle: "Cancel",
        posActionTitle: "Ok",
        nigAction: (){},
        posAction: ()async{
          navigator?.showLoading(" Deleting ....");
          await MyDataBase.deletemovie(movie.DataBaseID);
          // update the lists with the deleted movie
          deleteMovieFromWatchlist(movie);
          navigator?.hideLoading();
          notifyListeners();
        }
      );
    }
    else{
      navigator?.showMessage(
      "Do You Want To Add ?",
        nigActionTitle: "Cancel",
        posActionTitle: "Ok",
        posAction: ()async{
          navigator?.showLoading(" Adding ....");
          await MyDataBase.insertMovieData(movie);
          addMovieToWatchlist(movie);
          navigator?.hideLoading();
          notifyListeners();
        }
      );
    }
  }
  // compare the deleted movie and update the list
  void deleteMovieFromWatchlist(Movie movie) {
    for (int i =0 ; i<popularMovies!.length ; i++){
      if(movie.id.toString() == popularMovies![i].id.toString()){
        popularMovies![i].isInWatchList = false ;
        popularMovies![i].DataBaseID = '' ;
      }
    }
    for (int i =0 ; i<newReleaseMovies!.length ; i++){
      if(movie.id.toString() == newReleaseMovies![i].id.toString()){
        newReleaseMovies![i].isInWatchList = false ;
        newReleaseMovies![i].DataBaseID = '' ;
      }
    }
    for (int i =0 ; i<topRatedMovies!.length ; i++){
      if(movie.id.toString() == topRatedMovies![i].id.toString()){
        topRatedMovies![i].isInWatchList = false ;
        topRatedMovies![i].DataBaseID = '' ;
      }
    }
  }
  // compare the added movie and update the list
  void addMovieToWatchlist(Movie movie) {
    for (int i =0 ; i<popularMovies!.length ; i++){
      if(movie.id.toString() == popularMovies![i].id.toString()){
        popularMovies![i].isInWatchList = true ;
        popularMovies![i].DataBaseID = movie.DataBaseID ;
      }
    }
    for (int i =0 ; i<newReleaseMovies!.length ; i++){
      if(movie.id.toString() == newReleaseMovies![i].id.toString()){
        newReleaseMovies![i].isInWatchList = true ;
        newReleaseMovies![i].DataBaseID = movie.DataBaseID ;
      }
    }
    for (int i =0 ; i<topRatedMovies!.length ; i++){
      if(movie.id.toString() == topRatedMovies![i].id.toString()){
        topRatedMovies![i].isInWatchList = true ;
        topRatedMovies![i].DataBaseID = movie.DataBaseID ;
      }
    }
  }

}