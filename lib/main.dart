import 'package:flutter/material.dart';
import 'screens/switcher.dart';
import 'model/hero_image.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline2: TextStyle(
            fontSize: 24,
          ))),
      home: ColorSwitcher(),
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










