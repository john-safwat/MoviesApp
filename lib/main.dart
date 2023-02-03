import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Details%20Screen/Details_Screen.dart';
import 'package:movies/Presentation/UI/Home/HomeScreen.dart';
import 'package:movies/Presentation/UI/List%20of%20Movies/List_of_Movies.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main () async{

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(_) => HomeScreen(),
        DetailsScreen.routeName :(_) => DetailsScreen(),
        ListOfMovies.routeName :(_) => ListOfMovies()
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.Dark,
    );
  }
}
