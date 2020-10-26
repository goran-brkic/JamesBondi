import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/components/getUser.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatefulWidget {
  final User loggedUser;

  Body(this.loggedUser);
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _aboutYController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    User loggedUser = widget.loggedUser;
    //Map<String, dynamic> userInfo;

    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getUserInfo(loggedUser.email),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          Widget children;
          if (snapshot.hasData) {
            snapshot.data['about'] != null
                ? _aboutYController.text = snapshot.data['about']
                : _aboutYController.text;
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
                          child: snapshot.data['image'] != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      alignment: Alignment.center,
                                      child: Image.network(
                                          snapshot.data['image'])))
                              : Icon(
                                  Icons.person,
                                  size: 100.0,
                                  color: Colors.black54,
                                ),
                          padding: snapshot.data['image'] != null
                              ? EdgeInsets.all(0.0)
                              : EdgeInsets.all(15.0),
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
                        'Lecturer',
                        style: TextStyle(
                          fontFamily: 'RoundLight',
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),

                    // About me
                    Positioned(
                      left: size.width * 0.12,
                      top: size.height * (0.54),
                      child: Text(
                        "About me",
                        style: TextStyle(
                          fontFamily: 'RoundLight',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.57,
                      left: size.width * 0.12,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                        height: size.height * 0.2,
                        width: size.width * 0.77,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(color: customPurple),
                        ),
                        child: TextFormField(
                          enabled: false,
                          //initialValue: snapshot.data['about'],
                          controller: _aboutYController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: size.height * 0.014,
                            ),
                          ),
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return children;
        });
  }
}
