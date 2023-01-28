import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Details/Details_Screeen.dart';
import 'package:movies/Presentation/UI/Home/HomeScreen.dart';

void main () {
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
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.Dark,
    );
  }
}
