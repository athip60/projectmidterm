import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectmid/screen/bmi/calbmi.dart';
import 'package:projectmid/screen/exercise/exercise.dart';
import 'package:projectmid/theme/Colors.dart';

import 'cardlist/cardlist.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Widget
  Widget listClick(String img, String text, pathTo) {
    return GestureDetector(
      onTap: () {
        print(text);
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => pathTo);
        Navigator.of(context).push(materialPageRoute);
      },
      child: Container(
        height: 220,
        width: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'What Da Health',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'สุขภาพดีเริ่มได้ที่ตัวคุณ',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              listClick(
                  'https://img.freepik.com/free-photo/sandwich-with-chips_10323-156.jpg?size=626&ext=jpg',
                  'Healty Foods',
                  CardList()),
              listClick(
                  'https://image.freepik.com/free-photo/strong-bodybuilder-with-perfect-deltoid-muscles_1150-12348.jpg',
                  'Exercise Techniques',
                  Exercise()),
              listClick(
                  'https://image.freepik.com/free-photo/woman-standing-scale_53876-15132.jpg',
                  'BMI',
                  CalBMI()),
            ],
          ),
        ],
      ),
    );
  }
}
