import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Movie_Details_Model/Movie_Details_Response.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/Presentation/UI/Details/Screen%20Components/Movie_Details.dart';
import 'package:movies/Presentation/UI/Home/Global%20Widgets/BackDrop_Image_Widget.dart';

import '../../../Api/ApiManager/Api_Manager.dart';
import '../../../Api/Models/Popular_Movies_Models/Popular_Movie_Response.dart';
import '../Home/Tabs/HomeTab/Popular/Popular_Relesaes_Posters.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'Details Screen';

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    print(movie.id!.toString());
    String id = movie.id!.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder<MovieDetailsResponse>(
                future: Api_Manager.Get_Movie_Details(id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError){
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  }
                  if ( snapshot.data?.status_code != null){
                    return Center(
                      child: Text(snapshot.data!.status_message!),
                    );
                  }else {
                    return Movie_Details(movie: snapshot.data!);
                  }
                },
              ),
            )
          ),
          // popular movies
          Container(
            height: 250,
            child: FutureBuilder<PopularMovieResponse>(
              future: Api_Manager.Get_Popular_Movies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        "connection error ${snapshot.hasError.toString()}",
                        style: const TextStyle(color: Colors.white)),
                  );
                }
                if (snapshot.data?.status_message != null) {
                  return Center(
                    child: Text("error ${snapshot.data?.status_message}",
                        style:const TextStyle(color: Colors.white)),
                  );
                } else {
                  return Expanded(child: Popular_Relsases_Posters(movies: snapshot.data!.results!));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
