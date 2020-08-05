import 'package:flutter/material.dart';
import '../model/hero_image.dart';


class ImageCard extends StatelessWidget {
  HeroImage hero;
  ImageCard({this.hero});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: hero.title,
      child: Container(
        child: Image.asset(hero.image),
      ),
    );
  }
}