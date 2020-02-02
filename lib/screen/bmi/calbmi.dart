import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectmid/screen/bmi/showcal.dart';
import 'package:projectmid/theme/Colors.dart';

class CalBMI extends StatefulWidget {
  @override
  _CalBMIState createState() => _CalBMIState();
}

class BMIModel {
  double bmi;
  bool isNormal;

  String comments;

  BMIModel({this.bmi, this.isNormal, this.comments});
}

class _CalBMIState extends State<CalBMI> {
  double _heightOfUser = 100;
  double _weightOfUser = 40.0;
  double _bmi = 0;

  BMIModel _bmiModel;

  // logic
  void checkBMI() {
    setState(() {
      _bmi = _weightOfUser / ((_heightOfUser / 100) * (_heightOfUser / 100));

      if (_bmi >= 18.5 && _bmi <= 25) {
        _bmiModel =
            BMIModel(bmi: _bmi, isNormal: true, comments: "You are Totaly Fit");
      } else if (_bmi < 18.5) {
        _bmiModel = BMIModel(
            bmi: _bmi, isNormal: false, comments: "You are Underweighted");
      } else if (_bmi > 25 && _bmi <= 30) {
        _bmiModel = BMIModel(
            bmi: _bmi, isNormal: false, comments: "You are Overweighted");
      } else {
        _bmiModel =
            BMIModel(bmi: _bmi, isNormal: false, comments: "You are Obesed");
      }
    });
  }

  // Widget

  Widget heartPhoto() {
    return Container(
      height: 200,
      width: 200,
      child: SvgPicture.asset(
        "assets/images/heart.svg",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget nameFunction() {
    return Text(
      "BMI Calculator",
      style: TextStyle(
          color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),
    );
  }

  Widget discript() {
    return Text(
      "We care about your health",
      style: TextStyle(
          color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),
    );
  }

  Widget nameSlide(String func) {
    return Text(
      func,
      style: TextStyle(
          color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),
    );
  }

  Widget showSlide(double showSlide) {
    return Text(
      "$showSlide cm",
      style: TextStyle(
          color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),
    );
  }

  Widget buttonCalBMI() {
    return Container(
      child: FlatButton.icon(
        onPressed: () {
          checkBMI();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowResult(
                        bmiModel: _bmiModel,
                      )));
        },
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        label: Text("CALCULATE"),
        textColor: Colors.white,
        color: Colors.pink,
      ),
      width: double.infinity,
      padding: EdgeInsets.only(left: 16, right: 16),
    );
  }

  Widget br(double size) {
    return SizedBox(
      height: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              br(35),
              heartPhoto(),
              br(8),
              nameFunction(),
              discript(),
              br(32),
              nameSlide("Height (cm)"),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 80,
                  max: 250,
                  onChanged: (height) {
                    setState(() {
                      _heightOfUser = double.parse((height).toStringAsFixed(3));
                    });
                  },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_heightOfUser",
                ),
              ),
              showSlide(_heightOfUser),
              br(24),
              nameSlide("Weight (kg)"),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30,
                  max: 120,
                  onChanged: (height) {
                    setState(() {
                      _weightOfUser = double.parse((height).toStringAsFixed(3));
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_weightOfUser",
                ),
              ),
              showSlide(_weightOfUser),
              br(16),
              buttonCalBMI(),
            ],
          ),
        ),
      ),
    );
  }
}
