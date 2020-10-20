import 'package:flutter/material.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/roundedButton.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
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
                'assets/images/signIn.png',
                width: size.width * 0.7,
              ),
            ),
            Positioned(
                top: size.height * 0.43,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      // decoration: TextDecoration.underline,
                      fontFamily: 'Quiglet',
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: customPurple),
                )),
            InputField(title: "Username", topValue: 0.62),
            InputField(title: "Password", topValue: 0.73),
            Positioned(
                top: size.height * 0.84,
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
          ],
        ),
      ),
    );
  }
}

class ButtonPress extends StatefulWidget {
  ButtonPress({Key key}) : super(key: key);
  @override
  _ButtonPress createState() => _ButtonPress();
}

class _ButtonPress extends State<ButtonPress> {
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector();
  }
}
