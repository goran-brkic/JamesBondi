import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Categories%20Add%20Page/categories_add_screen.dart';
import 'package:jamesbondi/Screens/Consultation%20Screen/ConsultationScreen.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Student/profile_page_S.dart';
import 'package:jamesbondi/Screens/SearchScreen/search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'body2.dart';

class BodyLec extends StatefulWidget {
  _Body createState() => _Body();
}

class _Body extends State<BodyLec> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //lista widgeta za bottomNav bar
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    CategoriesScreen2(),
    SearchScreen(),
    ConsultationScreen(),
    //SProfileScreen(FirebaseAuth.instance.currentUser.email),
    LProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        //key: Key('lec-start'),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        floatingActionButton: FloatingActionButton(
          //key: Key('add-course-button'),
          child: Icon(Icons.add),
          backgroundColor: Colors.orange[800],
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoriesAddScreen()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: size.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                        //key: Key('categories'),
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
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
              ],
            ),
          ),
          //key: _formKey,
        ));
  }
}
