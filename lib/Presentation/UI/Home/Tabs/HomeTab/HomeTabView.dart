import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/New%20Releses/New_Rekleses_Widget.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Popular/Popular_Movie_Widget.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Top%20Rated/Top_Rated_Widget.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height* 0.33,
            child: Popular_Movies_Widget(),
          ),
          const SizedBox(
            height: 20,
          ),
          New_Releses_Widget(),
          Top_Rated_Widget(),
        ],
      ),
    );
  }
}

