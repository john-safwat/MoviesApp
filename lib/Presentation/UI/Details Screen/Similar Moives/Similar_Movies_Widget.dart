import 'package:flutter/material.dart';
import '../../../../../DataBase/Api/ApiManager/Api_Manager.dart';
import '../../../Theme/Theme.dart';
import 'Simailar_Movies.dart';

class Similar_Movies_Widget extends StatelessWidget {
  Api_Manager Api = Api_Manager();
  String id ;
  Similar_Movies_Widget({required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.Gray,
      child: FutureBuilder(
        future: Api.Get_Similar_Movies(id),
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
            return Similar_Movies(Movies: snapshot.data!.results!);
          }
        },
      ),
    );
  }
}