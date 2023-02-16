import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies/DataBase/Api/Models/Popular_Movies_Models/Results.dart';
import '../../../../../DataBase/Api/ApiManager/Api_Manager.dart';
import '../../../../../DataBase/FireBase/MyDataBase.dart';

class HomeTabViewModel extends ChangeNotifier {
  Api_Manager Api = Api_Manager();

  List<Movie>? popularMovies ;
  List<Movie>? newReleaseMovies ;
  List<Movie>? topRatedMovies ;

  String? errorMessage ;

  Future<List<Movie>> FireBaseCall() async {
    var movieslist = await MyDataBase.getMoviesToCompare();
    return movieslist;
  }

  // function to call the api to get the popular movies
  void getPoplarMovies() async {
    popularMovies = null ;
    errorMessage = null ;
    try {
      var response = await Api.Get_Popular_Movies();
      popularMovies = response.results! ;
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
      newReleaseMovies = response.results! ;
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
      topRatedMovies = response.results! ;
    } on HttpException catch(e){
      errorMessage =  "Connection To Server Error\n${e.toString()}";
    } on IOException catch(e){
      errorMessage =  "I/O Error \n${e.toString()}";
    } catch(e) {
      errorMessage = "UnKnown Error \n${e.toString()}";
    }
    notifyListeners();
  }

}