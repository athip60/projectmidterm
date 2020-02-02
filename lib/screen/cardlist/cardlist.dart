import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectmid/theme/Colors.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: LightBrighter,
          centerTitle: true,
          title: Text("อาหารเพื่อสุขภาพ"),
        ),
        backgroundColor: backgroundColor,
        body: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/foods.json'),
                builder: (context, snapshot) {
                  var foods = json.decode(snapshot.data.toString());

                  return new ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      var food = foods[index];
                      return new Card(
                        color: Brighter,
                        child: new Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    new NetworkImage(food['image']),
                              ),
                              title: new Text(
                                "Name: " + food['name'],
                                style: TextStyle(color: titleTextColor),
                              ),
                              subtitle: new Text(
                                "Country: " + food['discript'],
                                style: TextStyle(color: subTitleTextColor),
                              ),
                            ),
                            // new Image.network(food['image'], height: 200),
                            Divider(
                              height: 12.0,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: foods == null ? 0 : foods.length,
                  );
                }),
          ),
        ));
  }
}
