import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const Black =  Color(0xff121312);
  static const Gray =  Color(0xffC6C6C6);
  static const SmallGaryText =  Color(0xffB5B4B4);
  static const DarkGray =  Color(0xff343534);
  static const Gold =  Color(0xffFFBB3B);

  static ThemeData Dark = ThemeData(
    primaryColor: Gold ,
    canvasColor: Color(0xFF1A1A1A),
    scaffoldBackgroundColor: Black,
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      elevation: 5,
        selectedItemColor: Gold,
        selectedIconTheme: IconThemeData(
        color: Gold ,
        size:40
      ),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12
      ),
      unselectedItemColor: Gray,
      unselectedIconTheme: IconThemeData(
          color: Gray ,
          size:40
      ),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12
      ),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed
    )
  );
}