import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Details%20Screen/Details_Screen.dart';
import 'package:movies/Presentation/UI/Home/HomeScreen.dart';
import 'package:movies/Presentation/UI/List%20of%20Movies/List_of_Movies.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies/Presentation/UI/Splash/SplashScreen.dart';
import 'firebase_options.dart';

void main () async{

  await WidgetsFlutterBinding.ensureInitialized();
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
        ListOfMovies.routeName :(_) => ListOfMovies(),
        SplashScreen.routeName :(_) => SplashScreen(),
      },
      theme: MyTheme.Dark,
      home :AnimatedSplashScreen(
        splash: SplashScreen(),
        nextScreen: HomeScreen(),
        duration: 3000,
        splashIconSize: double.infinity,
      )
    );
  }
}
