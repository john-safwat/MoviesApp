import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Categories_Models/Genres.dart';
import 'package:movies/Presentation/UI/GlobalWidgets/Display_WIdget.dart';

import '../../../Api/ApiManager/Api_Manager.dart';
import '../../Theme/Theme.dart';
import '../Details Screen/Details_Screen.dart';

class ListOfMovies extends StatelessWidget {
  static const String routeName = 'List of Movies';
  Api_Manager Api = Api_Manager();

  @override
  Widget build(BuildContext context) {
    Genres Ganra = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
      appBar: AppBar(
        title: Text(Ganra.name!),
      ),
      body: FutureBuilder(
        future: Api.Categorie_Data(Ganra.id!.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center (
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError){
            return const Center(
              child: Text(
                'server thas error',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            );
          }
          if(snapshot.data?.status_message != null){
            return const Center(
              child: Text(
                'server has error',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            );
          }
          else {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => Display_Widget(movie: snapshot.data!.results![index]),
                      separatorBuilder: (context, index) => Container(
                        margin: const EdgeInsets.all(15),
                        height: 1,
                        width: double.infinity,
                        color: MyTheme.SmallGaryText,
                      ),
                      itemCount: snapshot.data!.results!.length
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
