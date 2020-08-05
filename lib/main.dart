import 'package:flutter/material.dart';
import 'screens/switcher.dart';

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
          )
        )
      ),
      home: ColorSwitcher(),
    );
  }
}
