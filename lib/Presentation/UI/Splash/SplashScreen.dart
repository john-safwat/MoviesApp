import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset('assets/images/movies.png'),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/routelogo.png'),
          )
        ],
      ),
    );
  }
}
