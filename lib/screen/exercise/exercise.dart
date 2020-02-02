import 'dart:ui';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectmid/theme/Colors.dart';

class Exercise extends StatefulWidget {
  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: LightBrighter,
          centerTitle: true,
          title: Text("บทความการออกกำลังกาย"),
        ),
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                child: Hero(
                  tag: "blog",
                  child: Container(
                    height: 200,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://siamorg.com/whatdahealth/img/protein.jpg"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      // make sure we apply clip it properly
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                          color: Colors.grey.withOpacity(0.1),
                          child: Text(
                            "บทความ",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(storage: CounterStorage());
                  }));
                },
              )
            ],
          ),
        ));
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class DetailScreen extends StatefulWidget {
  final CounterStorage storage;

  DetailScreen({Key key, @required this.storage}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _counter;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightBrighter,
      ),
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: 'imageHero',
            child: Card(
              color: Darker,
              child: new Column(
                children: <Widget>[
                  new Image.network(
                      'https://t3.ftcdn.net/jpg/01/93/60/78/240_F_193607819_cGMEqmOjpM4SpHob8AGoE3iITMr8he5A.jpg'),
                  new Padding(
                    padding: new EdgeInsets.all(0),
                    child: ListTile(
                      title: Text(
                        '\nเทคนิคการออกกำลังกาย',
                        style: new TextStyle(
                            fontSize: 18.0, color: titleTextColor),
                      ),
                      subtitle: Text(
                        "\nออกกำลังกาย” ประโยคสุดฮิตติดปากทั้งหนุ่มสาวในยุคนี้ไปแล้ว คนรอบกายเราไม่ว่าจะอวบ อ้วน หรือแม้แต่ดูผอมเพรียว ก็ล้วนแต่ “ออกกำลังกาย” ด้วยวิธีสารพัดต่างๆนาๆ โดยที่ไม่รู้ว่าวิธีที่กำลังทำอยู่นั้นถูกต้องหรือไม่ และบางวิธีก็ดูเป็นอันตรายกับชีวิตเป็นอย่างมาก เพื่อที่จะได้รู้ว่าวิธีที่เราทำอยู่นี้ถูกต้องและเหมาะสมหรือเปล่า เราจึงมีหลักการง่ายๆ สำหรับการออกกำลังกายเพื่อสุขภาพที่ดีและเป็นวิธีออกกำลังกายลดน้ำหนักที่ถูกต้องและรวดเร็วที่สุดมาแนะนำ",
                        style: TextStyle(color: subTitleTextColor),
                      ),
                    ),
                  ),
                  Divider(
                    height: 12.0,
                    color: Colors.white,
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ),
                        onPressed: _incrementCounter,
                      ),
                      Text(
                        ' $_counter ${_counter == 1 ? '' : 'like'}.',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: titleTextColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class DetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: LightBrighter,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Hero(
//             tag: 'imageHero',
//             child: Card(
//               child: new Column(
//                 children: <Widget>[
//                   new Image.network(
//                       'https://t3.ftcdn.net/jpg/01/93/60/78/240_F_193607819_cGMEqmOjpM4SpHob8AGoE3iITMr8he5A.jpg'),
//                   new Padding(
//                     padding: new EdgeInsets.all(0),
//                     child: ListTile(
//                       title: Text(
//                         '\nเทคนิคการออกกำลังกาย',
//                         style: new TextStyle(fontSize: 18.0),
//                       ),
//                       subtitle: Text(
//                           "\nออกกำลังกาย” ประโยคสุดฮิตติดปากทั้งหนุ่มสาวในยุคนี้ไปแล้ว คนรอบกายเราไม่ว่าจะอวบ อ้วน หรือแม้แต่ดูผอมเพรียว ก็ล้วนแต่ “ออกกำลังกาย” ด้วยวิธีสารพัดต่างๆนาๆ โดยที่ไม่รู้ว่าวิธีที่กำลังทำอยู่นั้นถูกต้องหรือไม่ และบางวิธีก็ดูเป็นอันตรายกับชีวิตเป็นอย่างมาก เพื่อที่จะได้รู้ว่าวิธีที่เราทำอยู่นี้ถูกต้องและเหมาะสมหรือเปล่า เราจึงมีหลักการง่ายๆ สำหรับการออกกำลังกายเพื่อสุขภาพที่ดีและเป็นวิธีออกกำลังกายลดน้ำหนักที่ถูกต้องและรวดเร็วที่สุดมาแนะนำ"),
//                     ),
//                   ),
//                   Divider(
//                     height: 12.0,
//                   ),
//                   ButtonBar(
//                     alignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       FlatButton(
//                           child: Icon(
//                             Icons.thumb_up,
//                             color: Colors.black87,
//                           ),
//                           onPressed: () {}),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
