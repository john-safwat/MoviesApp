import 'package:flutter/material.dart';

class BackDropImage extends StatelessWidget {
  String image ;
  BackDropImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          image,
          width: double.infinity,
          height: MediaQuery.of(context).size.height *0.23,
          fit: BoxFit.cover,
        ),
        const Icon(
          Icons.play_circle_fill_rounded,
          color: Colors.white,
          size: 70,
        )
      ],
    );
  }
}