import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  HeroImage(title: 'title12', image: 'assets/images/3.jpg'),

];

class HeroImage {
  String title;
  String image;

  HeroImage({this.title, this.image});
}

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

class ColorSwitcher extends StatefulWidget {
  ColorSwitcher({Key key}) : super(key: key);
  @override
  _ColorSwitcherState createState() => _ColorSwitcherState();
}

class _ColorSwitcherState extends State<ColorSwitcher> {
  Color backgroundColor = Colors.white;
  static Random random = new Random();
  Color getRandomColor() {
    Random random = new Random();
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  void changeColor() {
    setState(() => backgroundColor = getRandomColor());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PhotoList(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => {Navigator.of(context).push(_createRoute())},
              child: Icon(Icons.image),
            ),
            body: InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Hey there',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
              ),
              onTap: () => changeColor(),
            )));
  }
}
