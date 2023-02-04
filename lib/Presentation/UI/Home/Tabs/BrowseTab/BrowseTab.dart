import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/List%20of%20Movies/List_of_Movies.dart';

import '../../../../../DataBase/Api/ApiManager/Api_Manager.dart';

class BrowseTab extends StatelessWidget {
  Api_Manager Api = Api_Manager();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10
      ),
      child: FutureBuilder(
        future: Api.Catigories(),
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
          if(snapshot.data?.genres == null){
            return const Center(
              child: Text(
                'server thas error',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 16/9
              ),
              itemBuilder: (context, index) => Container(
                margin:const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, ListOfMovies.routeName ,arguments: snapshot.data!.genres![index]);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'assets/images/categori.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        snapshot.data!.genres![index].name!,
                        style:const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: snapshot.data!.genres!.length,
            );
          }
        },
      ),
    );
  }
}
