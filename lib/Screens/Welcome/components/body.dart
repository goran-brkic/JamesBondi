import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/SignUp/signup.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/roundedButton.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  Person _radioValue1 = Person.lecturer;
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
              top: size.height * 0.07,
              child: Image.asset(
                'assets/images/welcomeCircle.png',
                width: size.width * 0.6,
              ),
            ),
            Positioned(
              top: size.height * 0.15,
              child: Image.asset(
                'assets/images/welcome.png',
                width: size.width * 0.47,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(size.width * 0.035),
                  child: Text(
                    'Are you a lecturer or student?',
                    style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: customPurple,
                    ),
                  ),
                ),
                Text(
                  'Lecturer',
                  style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: customPurple),
                ),
                Radio(
                    value: Person.lecturer,
                    groupValue: _radioValue1,
                    onChanged: (Person value) {
                      setState(() {
                        _radioValue1 = value;
                      });
                    }),
                Text(
                  'Student',
                  style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: customPurple),
                ),
                Radio(
                    value: Person.student,
                    groupValue: _radioValue1,
                    onChanged: (Person value) {
                      setState(() {
                        _radioValue1 = value;
                      });
                    }),
              ],
            ),
            InputField(title: "Email", topValue: 0.57),
            InputField(title: "Username", topValue: 0.68),
            InputField(title: "Password", topValue: 0.79),
            Positioned(
              top: size.height * 0.87,
              child: RoundedButton(
                text: "Sign up",
                press: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpSection()));
                },
              ),
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
                  color: customPurple,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.95,
              left: size.width * 0.63,
              child: Text(
                "Sign in",
                style: TextStyle(
                  fontFamily: 'RoundLight',
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  color: customPurple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
