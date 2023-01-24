import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/Presentation/Home/HomeScreen.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(_)=> HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
