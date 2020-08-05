import 'package:flutter/material.dart';
import '../components/image_card.dart';
import '../main.dart';

class PhotoList extends StatefulWidget {
  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              delegate: SliverChildBuilderDelegate((context, index) {
                return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ImageCard(hero:heroImageList[index],)),
                    ), child: ImageCard(hero: heroImageList[index]),);
              }, childCount: heroImageList.length),
            )
          ],
        ));
  }
}