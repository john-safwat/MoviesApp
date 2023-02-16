import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movies/DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/HomeTeabNavigator.dart';
import '../../../../../DataBase/Api/ApiManager/Api_Manager.dart';
import '../../../../../DataBase/FireBase/MyDataBase.dart';

class HomeTabViewModel extends ChangeNotifier {
  Api_Manager Api = Api_Manager();

  List<Movie>? popularMovies ;
  List<Movie>? newReleaseMovies ;
  List<Movie>? topRatedMovies ;

  HomeTabNavigator? navigator;

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

  void updateWatchList(Movie movie){
    if (movie.isInWatchList!){
      navigator?.showLoading('delete');
    }
    else{
      navigator?.showLoading('add');
    }
    //updatelists();
    notifyListeners();
  }

  void updatelists()async{
    List<Movie> watchlist =  await MyDataBase.getMoviesToCompare();

    for(int i = 0 ; i<popularMovies!.length ;i++){
      for(int j=0;j<watchlist.length ; j++){
        if(popularMovies![i].id.toString() == watchlist[j].id.toString()){
          popularMovies![i].isInWatchList = true;
          popularMovies![i].DataBaseID = watchlist[j].DataBaseID;
        }
      }
    }
    for (int i =0  ; i< watchlist.length ; i++ ){
      for (int j = 0 ; j< topRatedMovies!.length ; j++){
        if (watchlist[i].id.toString() == topRatedMovies![j].id.toString()){
          topRatedMovies![j].isInWatchList = true ;
          topRatedMovies![j].DataBaseID = watchlist[i].DataBaseID;
        }
      }
    }
    for (int i =0  ; i< watchlist.length ; i++ ){
      for (int j = 0 ; j< newReleaseMovies!.length ; j++){
        if (watchlist[i].id.toString() == newReleaseMovies![j].id.toString()){
          newReleaseMovies![j].isInWatchList = true;
          newReleaseMovies![j].DataBaseID = watchlist[i].DataBaseID;
        }
      }
    }
  }
}