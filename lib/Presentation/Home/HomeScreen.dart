import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: "",
          )
        ],
      ),
    );
  }
}
