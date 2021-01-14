import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Categories%20Page/categories_screen.dart';
import 'package:jamesbondi/Screens/SearchScreen/search_screen.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _initialized
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Welcome',
            theme: ThemeData(
              backgroundColor: bgColor,
              scaffoldBackgroundColor: bgColor,
            ),
            home: SignInScreen(),
          )
        : Container();
  }
}
