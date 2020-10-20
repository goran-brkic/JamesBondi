import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/roundedButton.dart';
import 'package:jamesbondi/constants.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';

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
              top: size.height * 0.18,
              child: Image.asset(
                'assets/images/welcome.png',
                width: size.width * 0.57,
              ),
            ),
            InputField(title: "Email", topValue: 0.57),
            InputField(title: "Username", topValue: 0.68),
            InputField(title: "Password", topValue: 0.79),
            Positioned(
              top: size.height * 0.87,
              child: FlatButton(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: size.width * 0.07),
                  onPressed: () {},
                  color: Colors.purple,
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
                  )),
            ),
            Positioned(
              top: size.height * 0.95,
              left: size.width * 0.3,
              child: Text(
                "Already have an account?",
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: customPurple),
              ),
            ),
            Positioned(
              top: size.height * 0.95,
              left: size.width * 0.63,
              child: new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                      color: customPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
