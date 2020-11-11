import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Student/profile_page_S.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/userInfo.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  TextEditingController _mailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _mailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    if (auth.currentUser != null) {
      if (await UserInfoDB.getTypeOfUser(auth.currentUser.email) == 'true') {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LProfileScreen(auth.currentUser)));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SProfileScreen(auth.currentUser)));
      }
    }
  }

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
              ),
            ),
            InputField(
              title: "Email",
              topValue: 0.62,
              colorValue: customPurple,
              controller: _mailController,
            ),
            InputField(
              title: "Password",
              topValue: 0.73,
              colorValue: customPurple,
              controller: _passwordController,
            ),
            Positioned(
                top: size.height * 0.84,
                child: FlatButton(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: size.width * 0.07),
                    onPressed: () {
                      _login();
                    },
                    color: customPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Sign in",
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
