import 'package:flutter/material.dart';
import 'Popular/Popular_Movie_View_Model.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.4),
              ),
              child: Popular_Movies(),
            )
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.4),
              ),
            )
        ),
        Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.4),
              ),
            )
        ),
      ],
    );
  }
}
