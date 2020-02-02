import 'package:flutter/material.dart';
import 'package:projectmid/screen/home.dart';
import 'package:projectmid/theme/Colors.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What Da Health',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: backgroundColor,
          primaryTextTheme: TextTheme()),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new MyHomePage(),
        title: new Text(
          'Welcome In What Da Health',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
              color: titleTextColor),
        ),
        image: new Image.asset('assets/icon.png'),
        backgroundColor: backgroundColor,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}
