import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/constants.dart';
import 'package:jamesbondi/Screens/Welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      theme: ThemeData(
        backgroundColor: bgColor,
        scaffoldBackgroundColor: bgColor,
      ),
      home: WelcomeScreen(),
    );
  }
}
