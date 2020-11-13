import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/constants.dart';
import 'package:jamesbondi/components/userInfo.dart';

class Body extends StatefulWidget {
  final User loggedUser;

  Body(this.loggedUser);
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final User loggedUser = widget.loggedUser;
    Map<String, dynamic> userInfo;
    UserInfoDB.getUserInfo(loggedUser.email).then((value) => userInfo);
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: UserInfoDB.getUserInfo(loggedUser.email),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          Widget children;
          if (snapshot.hasData) {
            children = SingleChildScrollView(
              child: Container(
                height: size.height,
                width: double.infinity,
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

                    // Edit icon
                    Positioned(
                      top: size.height * 0.05,
                      right: size.width * 0.05,
                      child: Image.asset(
                        'assets/images/pencil.png',
                        height: size.height * 0.04,
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
            );
          } else {
            children = Container();
          }
          return children;
        });
  }
}
