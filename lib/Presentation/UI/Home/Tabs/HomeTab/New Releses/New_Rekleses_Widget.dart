import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Popular_Movies_Models/Results.dart';
import 'package:movies/FireBase/MyDataBase.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/New%20Releses/New_Releses.dart';
import '../../../../../../Api/ApiManager/Api_Manager.dart';

class New_Releses_Widget extends StatelessWidget {
  Api_Manager Api = Api_Manager();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.Gray,
      child: FutureBuilder(
        future: Api.Get_Popular_Movies(),
        builder: (context, snapshot){
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
            return New_Releses(Movies: snapshot.data!.results!);
          }
        },
      ),
    );
  }
}
