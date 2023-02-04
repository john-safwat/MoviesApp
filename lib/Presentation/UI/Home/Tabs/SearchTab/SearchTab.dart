import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/GlobalWidgets/Display_WIdget.dart';

import '../../../../../DataBase/Api/ApiManager/Api_Manager.dart';
import '../../../../../DataBase/Api/Models/Popular_Movies_Models/Results.dart';


class SearchTab extends StatefulWidget {
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  Api_Manager Api = Api_Manager();

  String query = '';

  List<Movie> Movies = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 50,
            margin:const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: MyTheme.DarkGray,
              borderRadius: BorderRadius.circular(100)
            ),
            child: TextFormField(
              onChanged: (value){
                query = value;
                readData();
              },
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle:const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  prefixIcon:const Icon(
                    Icons.search_rounded,
                    size: 22,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide(width: 2 , color: MyTheme.SmallGaryText),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2 , color: MyTheme.SmallGaryText),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  border: OutlineInputBorder(
                      borderSide:const BorderSide(width: 2 , color: MyTheme.SmallGaryText),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide(width: 2 , color: MyTheme.SmallGaryText),
                      borderRadius: BorderRadius.circular(100)
                  )
              ),
            ),
          ),
          Expanded(
            child: Movies.isEmpty ? Center(
              child: Image.asset('assets/images/Empty.png'),
            ):ListView.separated(
              itemBuilder: (context, index) => Display_Widget(movie: Movies[index],),
              itemCount: Movies.length,
              separatorBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(15),
                height: 1,
                width: double.infinity,
                color: MyTheme.SmallGaryText,
              ),
            ),
          )
        ],
      ),
    );
  }

  void readData ()async{
    await Api.Search(query).then(
      (value) {
        if(value.status_message != null) {
          print("has error");
        }else {
          Movies = value.results!;
        }
      }
    );
    setState(() {

    });
  }
}
