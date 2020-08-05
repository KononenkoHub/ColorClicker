import 'package:flutter/material.dart';
import '../model/hero_image.dart';

class ImageInfoPage extends StatelessWidget {
  final HeroImage heroImage;

  ImageInfoPage({this.heroImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(heroImage.image),
            Text(heroImage.title)
          ],
        ),
      ),
    );
  }
}
