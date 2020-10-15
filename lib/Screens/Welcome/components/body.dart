import 'package:flutter/material.dart';
import 'package:jamesbondi/constants.dart';

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
              'assets/images/welcomeCircle.png',
              width: size.width * 0.7,
            ),
          ),
          Positioned(
            top: size.height * 0.17,
            child: Image.asset(
              'assets/images/welcomeArt.png',
              width: size.width * 0.5,
            ),
          ),
          Positioned(
              top: size.height * 0.4,
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontFamily: 'Quiglet',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: customPurple),
              )),
          Positioned(
              top: size.height * 0.82,
              child: FlatButton(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: size.width * 0.07),
                  onPressed: () {},
                  color: customPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontFamily: 'RoundLight',
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.white),
                  ))),
          InputTextContainer(size: size),
          Positioned(
              top: size.height * 0.9,
              left: size.width * 0.3,
              child: Text(
                "Already have an account?",
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: customPurple),
              )),
          Positioned(
              top: size.height * 0.9,
              left: size.width * 0.63,
              child: Text(
                "Sign in",
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    color: customPurple),
              )),
        ],
      ),
    );
  }
}

class InputTextContainer extends StatelessWidget {
  const InputTextContainer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: size.height * 0.06,
      width: size.width * 0.77,
      decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(29),
          border: Border.all(color: customPurple)),
    );
  }
}
