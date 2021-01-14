import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Edit%20Profile/edit.dart';
import 'package:jamesbondi/Screens/JoinChannel/join_screen.dart';
import 'package:jamesbondi/Screens/List%20Owned/list_courses_screen.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/constants.dart';
import 'package:jamesbondi/components/userInfo.dart';

class Body extends StatefulWidget {
  final String loggedUser;

  Body(this.loggedUser);
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final String loggedUser = widget.loggedUser;
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: UserInfoDB.getUserInfo(loggedUser),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          Widget children;
          if (snapshot.connectionState == ConnectionState.done) {
            children = Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      // Top artwork
                      Positioned(
                        top: 0,
                        child: Image.asset(
                          'assets/images/top_part_profile.png',
                          width: size.width,
                        ),
                      ),

                      //My Profile
                      Positioned(
                        top: size.height * 0.05,
                        left: size.width * 0.05,
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              fontFamily: 'Quiglet',
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                      // Profile photo
                      Positioned(
                        top: size.height * 0.23,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: customPurple),
                              borderRadius: BorderRadius.circular(100)),
                          child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 0,
                            fillColor: Color(0xFFF3F3F3),
                            child: Icon(
                              Icons.person,
                              size: 100.0,
                              color: Colors.black54,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                        ),
                      ),

                      // First and Last Name
                      Positioned(
                        top: size.height * 0.43,
                        child: Text(
                          snapshot.data['firstName'] +
                              ' ' +
                              snapshot.data['lastName'],
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            color: customPurple,
                          ),
                        ),
                      ),

                      //video butt
                      /*
                      Positioned(
                        top: size.height * 0.6,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: size.width * 0.07),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => JoinScreen()));
                          },
                          child: Text("Video"),
                        ),
                      ),
                      */

                      // Type of Person
                      Positioned(
                        top: size.height * 0.47,
                        child: Text(
                          'Student',
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Text("loading");
          }
          return children;
        });
  }
}
