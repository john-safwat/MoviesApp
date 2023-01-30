import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const Black =  Color(0xff121312);
  static const Gray =  Color(0xff282A28);
  static const SmallGaryText =  Color(0xffB5B4B4);
  static const DarkGray =  Color(0xff343534);
  static const Gold =  Color(0xffFFBB3B);

  static ThemeData Dark = ThemeData(
    primaryColor: Gold ,
    canvasColor: const Color(0xFF1A1A1A),
    scaffoldBackgroundColor: Black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1D1E1D),
      centerTitle: true ,
    ),
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
      unselectedItemColor: SmallGaryText,
      unselectedIconTheme: IconThemeData(
          color: SmallGaryText ,
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