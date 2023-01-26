import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Home/Global%20Widgets/BackDrop_Image_Widget.dart';
import '../../../../../Api/ApiManager/Api_Manager.dart';
import '../../../../../Api/Models/Popular_Movies_Models/Popular_Movie_Response.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
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
                    itemBuilder: (context, index) => BackDropImageWidget(Image: snapshot.data!.results![index].backdropPath!),
                    itemCount: snapshot.data?.results?.length ?? 0,
                  );
                }
              },
            ),
          ),
        ],
    );
  }
}
