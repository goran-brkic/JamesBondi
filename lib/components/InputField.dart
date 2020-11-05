import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final double topValue;
  final TextEditingController controller;
  final bool enabledField;
  final Color colorValue;
  const InputField(
      {Key key,
      this.title,
      this.topValue,
      this.controller,
      this.enabledField,
      this.colorValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: new Stack(
        children: <Widget>[
          Positioned(
            top: size.height * topValue,
            left: size.width * 0.12,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              height: size.height * 0.06,
              width: size.width * 0.77,
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(29),
                border: Border.all(color: colorValue),
              ),
              child: TextFormField(
                enabled: enabledField,
                controller: controller,
                obscureText: (title == "Password") ? true : false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontFamily: 'RoundLight',
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.12,
            top: size.height * (topValue - 0.035),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'RoundLight',
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
