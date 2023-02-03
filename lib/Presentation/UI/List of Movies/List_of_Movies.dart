import 'package:flutter/material.dart';
import 'package:movies/Api/Models/Categories_Models/Genres.dart';

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
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, DetailsScreen.routeName , arguments: snapshot.data!.results![index]);
                        },
                        child: Container(
                          height: 100,
                          margin:const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: snapshot.data!.results![index].backdropPath == null ?
                                Image.asset('assets/images/gallery.png'):
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${snapshot.data!.results![index].backdropPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 4,
                                  child:Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                snapshot.data!.results![index].title!,
                                                style:const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                ),
                                                softWrap: true,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                snapshot.data!.results![index].releaseDate == null? "UnKnown Release Date":snapshot.data!.results![index].releaseDate!,
                                                style:const TextStyle(color: MyTheme.SmallGaryText,),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                snapshot.data!.results![index].overview!,
                                                style:const TextStyle(color: MyTheme.SmallGaryText,),
                                                softWrap: true,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
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
