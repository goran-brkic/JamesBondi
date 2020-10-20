import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/Screens/Signup/signup.dart';
import 'package:jamesbondi/constants.dart';
import 'package:jamesbondi/Screens/Welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      theme: ThemeData(
        backgroundColor: bgColor,
        scaffoldBackgroundColor: bgColor,
      ),
//      home: WelcomeScreen(),
      home: SignUpScreen(),
    );
  }
}
