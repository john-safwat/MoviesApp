import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Presentation/Theme/Theme.dart';

class BackDropImage extends StatelessWidget {
  String image ;
  BackDropImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: MyTheme.Gold,)),
          errorWidget: (context, url, error) =>const  Icon(Icons.error_outline_rounded , color: Colors.red,),
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
