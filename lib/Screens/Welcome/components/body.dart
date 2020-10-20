import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/roundedButton.dart';
import 'package:jamesbondi/constants.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/Screens/SignUp/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../components/checkAvailable.dart';

class Body extends StatefulWidget {
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _invalidInput = false;
  bool _usedEmail = false;
  bool _usedUsername = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
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
            InputField(
                title: "Email", topValue: 0.57, controller: _emailController),
            InputField(
                title: "Username",
                topValue: 0.68,
                controller: _usernameController),
            //InputField(title: "Password", topValue: 0.79),
            Positioned(
              top: size.height * 0.78,
              child: FlatButton(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: size.width * 0.07),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_emailController.text)) {
                        setState(() {
                          _invalidInput = true;
                          _emailController.clear();
                        });
                      } else if (!await checkEmailAddress(
                          _emailController.text)) {
                        setState(() {
                          _usedEmail = true;
                          _emailController.clear();
                        });
                      } else if (!await checkUser(_usernameController.text)) {
                        setState(() {
                          _usedUsername = true;
                          _usernameController.clear();
                        });
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen(
                                  emailAddressInput: _emailController.text,
                                  usernameInput: _usernameController.text,
                                )));
                      }
                    }
                  },
                  /*{
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  },
                  */
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
                  )),
            ),
            Positioned(
              top: size.height * 0.88,
              left: size.width * 0.24,
              child: Text(
                "Already have an account?",
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: customPurple),
              ),
            ),
            Positioned(
              top: size.height * 0.88,
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
                      fontSize: 14,
                      color: customPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
