import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import '../../../../../../DataBase/Api/ApiManager/Api_Manager.dart';
import 'Top_Rated.dart';

class Top_Rated_Widget extends StatelessWidget {
  Api_Manager Api = Api_Manager();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      color: MyTheme.Gray,
      child: FutureBuilder(
        future: Api.Get_Top_Rated_Movies(),
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
            return Top_Rated(Movies: snapshot.data!.results!);
          }
        },
      ),
    );
  }
}