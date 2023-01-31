import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/New%20Releses/New_Rekleses_Widget.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Popular/Popular_Movie_Widget.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Top%20Rated/Top_Rated_Widget.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Popular_Movies_Widget(),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 4,
          child: New_Releses_Widget(),
        ),
        Expanded(
          flex: 6,
          child: Top_Rated_Widget(),
        ),
      ],
    );
  }
}
