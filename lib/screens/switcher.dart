import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'gallery.dart';

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