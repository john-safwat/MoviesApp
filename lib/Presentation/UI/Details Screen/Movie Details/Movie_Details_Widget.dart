import 'package:flutter/material.dart';
import '../../../../../DataBase/Api/ApiManager/Api_Manager.dart';
import 'Movie_Details.dart';


class Movie_Details_Widget extends StatelessWidget {
  Api_Manager Api = Api_Manager();
  String movieID ;
  Movie_Details_Widget({required this.movieID});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api.Get_Movie_Details(movieID),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          }
          if(snapshot.data?.status_message != null){
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          }else{
            return Movie_Details(movie: snapshot.data!,);
          }
        },
    );
  }
}
