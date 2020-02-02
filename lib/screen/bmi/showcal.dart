import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectmid/theme/Colors.dart';

class ShowResult extends StatelessWidget {
  final bmiModel;
  ShowResult({this.bmiModel});

  // Widget

  Widget photoCal() {
    return Container(
      height: 200,
      width: 200,
      child: bmiModel.isNormal
          ? SvgPicture.asset(
              "assets/images/happy.svg",
              fit: BoxFit.contain,
            )
          : SvgPicture.asset(
              "assets/images/sad.svg",
              fit: BoxFit.contain,
            ),
    );
  }

  Widget br(double size) {
    return SizedBox(
      height: size,
    );
  }

  Widget calSucess() {
    return Text(
      "Your BMI is ${bmiModel.bmi.round()}",
      style: TextStyle(
          color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),
    );
  }

  Widget contentSucess() {
    return Text(
      "${bmiModel.comments}",
      style: TextStyle(
          color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget backButton(context) {
    return Container(
      child: FlatButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        label: Text("LET CALCULATE AGAIN"),
        textColor: Colors.white,
        color: Colors.pink,
      ),
      width: double.infinity,
      padding: EdgeInsets.only(left: 16, right: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              photoCal(),
              br(8),
              calSucess(),
              contentSucess(),
              br(16),
              bmiModel.isNormal
                  ? Text(
                      "Hurray! Your BMI is Normal.",
                      style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )
                  : Text(
                      "Sadly! Your BMI is not Normal.",
                      style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
              br(16),
              backButton(context),
            ],
          ),
        ));
  }
}
