import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/GlobalWidgets/Display_WIdget.dart';

import '../../../../../DataBase/FireBase/MyDataBase.dart';
import '../../../../Theme/Theme.dart';

class WatchListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MyDataBase.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var movies = snapshot.data?.docs.map((doc) => doc.data()).toList();
        if(snapshot.hasError){return const Center(child: Text("loading error" ,style: TextStyle(fontSize: 30),),);}
        return Column(
          children: [
            Expanded(
              child: movies!.isEmpty ? Center(
                child: Image.asset('assets/images/Empty.png'),
              ):ListView.separated(
                  itemBuilder: (context, index) => Display_Widget(movie: movies[index]),
                  separatorBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(15),
                    height: 1,
                    width: double.infinity,
                    color: MyTheme.SmallGaryText,
                  ),
                  itemCount: movies.length
              ),
            ),
          ],
        );
      },
    );
  }
}
