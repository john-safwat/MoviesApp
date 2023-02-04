import 'package:flutter/material.dart';

class DetailsPosterImage extends StatelessWidget {
  String image ;
  DetailsPosterImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius:const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500${image}',
            height: MediaQuery.of(context).size.height * 0.25,
          ),
        ),
      ],
    );
  }
}
