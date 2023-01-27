import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Home/Global%20Widgets/BackDrop_Image_Widget.dart';
import 'package:movies/Presentation/UI/Home/Global%20Widgets/Poster_Widget.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Popular/Popular_Relesaes_Posters.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Popular/Popular_Widget.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Top_Rated/Top_Rated_Widget.dart';
import '../../../../../Api/ApiManager/Api_Manager.dart';
import '../../../../../Api/Models/Popular_Movies_Models/Popular_Movie_Response.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // popular movies
          Expanded(
            flex:5,
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
                  return ListView.builder(
                    itemBuilder: (context, index) => Popular_Widget(movie: snapshot.data!.results![index]),
                    itemCount: snapshot.data?.results?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                  );
                }
              },
            ),
          ),
          // popular movies
          Expanded(
            flex: 4,
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
                  return Popular_Relsases_Posters(movies: snapshot.data!.results!);
                }
              },
            ),
          ),
          // top rated movies
          Expanded(
            flex:5,
            child: FutureBuilder<PopularMovieResponse>(
              future: Api_Manager.Get_Top_Rated_Movies(),
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
                  return Top_Rated_Widget( movies: snapshot.data!.results!);
                }
              },
            ),
          ),
        ],
    );
  }
}
