import 'package:flutter/material.dart';

class BackDrop_Image extends StatelessWidget {
  String image;
  double width;
  double height;

  BackDrop_Image({
    required this.image,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          image,
          height: height,
          width: width,
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