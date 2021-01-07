import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Consultation%20Screen/ConsultationScreen.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Student/profile_page_S.dart';
import 'package:jamesbondi/Screens/SearchScreen/search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'body2.dart';

class BodyS extends StatefulWidget {
  _Body createState() => _Body();
}

class _Body extends State<BodyS> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //lista widgeta za bottomNav bar
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    CategoriesScreen2(),
    SearchScreen(),
    ConsultationScreen(),
    SProfileScreen(FirebaseAuth.instance.currentUser.email),
    //LProfileScreen(FirebaseAuth.instance.currentUser.email)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /*

  bool lec;
  void getType() async {
    lec = await SharedPreferences.getInstance()
        .then((value) => value.getBool('lecturer'));
  }

  @override
  void initState() {
    super.initState();
    getType();
  }
  */

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: size.height * 0.08,
          //width: size.width - 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              MaterialButton(
                  minWidth: 2,
                  onPressed: () {
                    _onItemTapped(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.category),
                      Text('Categories',
                          style: TextStyle(fontSize: size.width * 0.03))
                    ],
                  )),
              MaterialButton(
                  minWidth: 2,
                  onPressed: () {
                    _onItemTapped(1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.search),
                      Text('Search',
                          style: TextStyle(fontSize: size.width * 0.03))
                    ],
                  )),
              MaterialButton(
                minWidth: 2,
                onPressed: () {
                  _onItemTapped(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.ring_volume),
                    Text('Consultation',
                        style: TextStyle(fontSize: size.width * 0.03))
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _onItemTapped(3);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.group_outlined),
                    Text('Profile',
                        style: TextStyle(fontSize: size.width * 0.03))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //key: _formKey,
    );
  }
}
//chooseDiff je u body2.dart
/*
  chooseDifficulty(context, size, category) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.08, size.height * 0.4, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Choose a difficulty',
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.25,
                            color: customPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.14, size.height * 0.45, 0, 0),
                    child: Column(
                      children: <Widget>[
                        /////////
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ListCoursesScreen("beginner", category)));
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Begginer",
                            style: TextStyle(
                                fontFamily: 'RoundLight',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: customPurple),
                          ),
                        ), //////////
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ListCoursesScreen(
                                    "intermediate", category)));
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Intermediate",
                            style: TextStyle(
                                fontFamily: 'RoundLight',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: customPurple),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ListCoursesScreen("advanced", category)));
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Advanced",
                            style: TextStyle(
                                fontFamily: 'RoundLight',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: customPurple),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
*/
