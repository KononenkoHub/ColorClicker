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

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(child: Icon(Icons.add),),
            body: InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Hey there',
                        style: Theme.of(context).textTheme.headline2),
                    //Positioned(
                      //  left: MediaQuery.of(context).size.width,
                        //bottom: 0,
                        //child: Container(
                      //child: Text(backgroundColor.toString()),
                    //))
                  ],
                ),
              ),
              onTap: () => changeColor(),
              //splashColor: backgroundColor,
            )));
  }
}
