import 'package:flutter/material.dart';
import 'package:gapopo_media/model/image_details.dart';

class FullScreenImage extends StatelessWidget {
  ImageDetails image;
  FullScreenImage({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageTag',
            child: Image.network(
                  image.largeImageURL,//      'assets/sample_image.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
