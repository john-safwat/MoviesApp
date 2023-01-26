import 'package:flutter/material.dart';

class BackDropImageWidget extends StatelessWidget {
  String Image ;
  BackDropImageWidget({required this.Image});

  @override
  Widget build(BuildContext context) {
    Image = "https://image.tmdb.org/t/p/w500" + Image;
    print(Image);
    return Container(
      height: MediaQuery.,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(Image),
        )
      ),
    );
  }
}
