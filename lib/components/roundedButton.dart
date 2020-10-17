import 'package:flutter/material.dart';
import 'package:jamesbondi/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = customPurple,
    this.textColor = Colors.white,
  }) : super(key: key);

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
