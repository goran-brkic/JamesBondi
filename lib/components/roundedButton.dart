import 'package:flutter/material.dart';
import 'package:jamesbondi/constants.dart';

class RoundedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoundedButtonStateful(),
    );
  }
}

class RoundedButtonStateful extends StatefulWidget {
  String text;
  @override
  _RoundedButton createState() => _RoundedButton(text: text);
}

class _RoundedButton extends State<RoundedButtonStateful> {
  String text;
  Function press;
  Color color, textColor;
  Key key;
  _RoundedButton({
    Key key,
    @required String text,
    this.press,
    this.color = customPurple,
    this.textColor = Colors.white,
  })  : this.key = key,
        this.text = text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: FlatButton(
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: size.width * 0.07),
            onPressed: press,
            color: customPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'RoundLight',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: textColor),
            )));
  }
}
