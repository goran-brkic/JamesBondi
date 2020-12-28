import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Categories%20Add%20Page/categories_add_screen.dart';
import 'package:jamesbondi/Screens/Categories%20Page/categories_screen.dart';
import 'package:jamesbondi/Screens/Consultation%20Screen/ConsultationScreen.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Student/profile_page_S.dart';
import 'package:jamesbondi/Screens/Welcome/welcome_screen.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/userInfo.dart';
import 'package:jamesbondi/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _showPassDialog(var context) async {
    return showDialog<void>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Wrong password!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        },
        context: context);
  }

  Future<void> _showUserDialog(var context) async {
    return showDialog<void>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No user found with that email address!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        },
        context: context);
  }

  Future<void> _showInvalidDialog(var context) async {
    return showDialog<void>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please enter a valid email address!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        },
        context: context);
  }

  void _login(var context) async {
    try {
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _mailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _mailController.clear();
        _passwordController.clear();
        print('No user found for that email.');
        await _showUserDialog(context);
      } else if (e.code == 'wrong-password') {
        _passwordController.clear();
        await _showPassDialog(context);
        print('Wrong password provided for that user.');
      }
    }

    if (auth.currentUser != null) {
      final prefs = await SharedPreferences.getInstance();
      if (await UserInfoDB.getTypeOfUser(auth.currentUser.email) == 'true') {
        await prefs.setBool('lecturer', true);
      } else {
        await prefs.setBool('lecturer', false);
      }

      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CategoriesAddScreen()));
    }
  }

  bool _emptyMail = false;
  bool _emptyPass = false;

  String _emailReturn() {
    if (_emptyMail) {
      _emptyMail = false;
      return 'Enter an email!';
    }
    return "Email";
  }

  String _passReturn() {
    if (_emptyPass) {
      _emptyPass = false;
      return 'Enter a password!';
    }
    return 'Password';
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
              topValue: 0.62,
              colorValue: _emptyMail ? Colors.red : customPurple,
              controller: _mailController,
              title: _emailReturn(),
            ),
            InputField(
              topValue: 0.73,
              colorValue: _emptyPass ? Colors.red : customPurple,
              controller: _passwordController,
              title: _passReturn(),
            ),
            Positioned(
                top: size.height * 0.84,
                child: FlatButton(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: size.width * 0.07),
                    onPressed: () {
                      if (_mailController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        _emptyPass = _passwordController.text.isEmpty;
                        _emptyMail = _mailController.text.isEmpty;
                        setState(() {});
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_mailController.text)) {
                        _mailController.clear();
                        _passwordController.clear();
                        _showInvalidDialog(context);
                      } else {
                        _login(context);
                      }
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
            Positioned(
              top: size.height * 0.93,
              left: size.width * 0.24,
              child: Text(
                "Don't have an account?",
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: customPurple),
              ),
            ),
            Positioned(
              top: size.height * 0.93,
              left: size.width * 0.60,
              child: new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                child: Text(
                  "Sign up",
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
