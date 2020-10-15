import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.height * 0.1,
            child: Image.asset(
              'assets/images/welcomeArt.png',
              width: size.width * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
