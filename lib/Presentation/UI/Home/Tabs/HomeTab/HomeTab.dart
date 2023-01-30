import 'package:flutter/material.dart';
import 'package:movies/Presentation/UI/Home/Tabs/HomeTab/Popular/Popular_Movie_Widget.dart';
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(1),
              ),
              child: Popular_Movies_Widget(),
            )
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(1),
              ),
            )
        ),
        Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(1),
              ),
            )
        ),
      ],
    );
  }
}
