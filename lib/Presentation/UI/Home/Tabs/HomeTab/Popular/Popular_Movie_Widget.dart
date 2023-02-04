import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Popular/Popular_Movies.dart';

import '../../../../../../DataBase/Api/ApiManager/Api_Manager.dart';

class Popular_Movies_Widget extends StatelessWidget {
  Api_Manager Api = Api_Manager();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.Get_Popular_Movies(),
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
          return Popular_Movies(Movies: snapshot.data!.results!);
        }
      },
    );
  }
}
