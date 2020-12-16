import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/AddCourse/add_course.dart';
import 'package:jamesbondi/Screens/Categories%20Add%20Page/categories_add_screen.dart';
import 'package:jamesbondi/Screens/Course%20Page/CourseScreen.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Student/profile_page_S.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/Categories Page/categories_screen.dart';
import 'Screens/Consultation Screen/ConsultationScreen.dart';

void main() {
  runApp(MyApp());
}

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
<<<<<<< HEAD
            home: CategoriesAddScreen(),
=======
//      home: WelcomeScreen(),
            //home: SignInScreen(),
            home: SignInScreen(),
>>>>>>> 4342c9403759129a984865232e1ed25f15ec3370
          )
        : Container();
  }
}
