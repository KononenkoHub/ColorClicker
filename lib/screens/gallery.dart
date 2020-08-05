import 'package:flutter/material.dart';
import '../components/image_card.dart';
import '../model/hero_image.dart';

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
                        builder: (context) => ImageCard(
                              hero: heroImageList[index],
                            )),
                  ),
                  child: ImageCard(hero: heroImageList[index]
                  ),
                );
              }, childCount: heroImageList.length),
            )
          ],
        )
      );
  }
}


List heroImageList = [
  HeroImage(title: 'title1', image: 'assets/images/1.jpg'),
  HeroImage(title: 'title2', image: 'assets/images/2.jpg'),
  HeroImage(title: 'title3', image: 'assets/images/3.jpg'),
  HeroImage(title: 'title4', image: 'assets/images/1.jpg'),
  HeroImage(title: 'title5', image: 'assets/images/2.jpg'),
  HeroImage(title: 'title6', image: 'assets/images/3.jpg'),
  HeroImage(title: 'title7', image: 'assets/images/1.jpg'),
  HeroImage(title: 'title8', image: 'assets/images/2.jpg'),
  HeroImage(title: 'title9', image: 'assets/images/3.jpg'),
  HeroImage(title: 'title10', image: 'assets/images/1.jpg'),
  HeroImage(title: 'title11', image: 'assets/images/2.jpg'),
  HeroImage(title: 'title12', image: 'assets/images/3.jpg')
]; // hardcode data for test purposes
