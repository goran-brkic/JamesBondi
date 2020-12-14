import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/List%20Courses%20Page/list_courses_screen.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/constants.dart';

class BodyStudent extends StatefulWidget {
  _BodyStudent createState() => _BodyStudent();
}

class _BodyStudent extends State<BodyStudent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
            child: Container(
                height: size.height,
                width: double.infinity,
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Positioned(
                    top: size.height * 0.001,
                    child: Image.asset(
                      'assets/images/top_part_courses.png',
                      width: size.width * 1,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.15,
                    child: Image.asset(
                      'assets/images/Line 1.png',
                      width: size.width * 0.7,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.08,
                    child: Text(
                      "Consultations",
                      style: TextStyle(
                          fontFamily: 'RoundLight',
                          fontWeight: FontWeight.normal,
                          fontSize: 34,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.165,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "your scheduled meetings",
                        style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 26,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.3,
                    child: Container(
                        width: size.width - 10,
                        height:
                            70.0 + (4 * 30), // 100 + num of consultations * 30
                        decoration: BoxDecoration(
                          color: Colors.grey[150],
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          border: Border(
                            top: BorderSide(width: 1.0, color: customPurple),
                            left: BorderSide(width: 1.0, color: customPurple),
                            right: BorderSide(width: 1.0, color: customPurple),
                            bottom: BorderSide(width: 1.0, color: customPurple),
                          ),
                        ),
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width / 2 - 47,
                                    child: Text(
                                      "Consulatation title",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 20,
                                    color: customPurple,
                                  ),
                                  Container(
                                    child: Text(
                                      "Date",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                ]),
                            Container(
                                height: 3,
                                width: size.width - 10,
                                color: customPurple),
                            //num of consultations -> put in for
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width / 2 - 56,
                                    child: Text(
                                      //name of consultations from database
                                      "Consultations for design",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 25,
                                    color: customPurple,
                                  ),
                                  Container(
                                    child: Text(
                                      //date for consultation from database
                                      "Date",
                                      style: TextStyle(
                                          fontFamily: 'datum',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                ]),
                            Container(
                                height: 3,
                                width: size.width - 10,
                                color: customPurple),

                            //end of first consultation
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width / 2 - 56,
                                    child: Text(
                                      //name of consultations from database
                                      "Consultations for design",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 25,
                                    color: customPurple,
                                  ),
                                  Container(
                                    child: Text(
                                      //date for consultation from database
                                      "Date",
                                      style: TextStyle(
                                          fontFamily: 'datum',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                ]),
                            Container(
                                height: 3,
                                width: size.width - 10,
                                color: customPurple),

                            //end of second consultation
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width / 2 - 56,
                                    child: Text(
                                      //name of consultations from database
                                      "Consultations for design",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 25,
                                    color: customPurple,
                                  ),
                                  Container(
                                    child: Text(
                                      //date for consultation from database
                                      "Date",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                ]),
                            Container(
                                height: 3,
                                width: size.width - 10,
                                color: customPurple),

                            //end of third consultation
                          ],
                        )),
                  ),

                  //*********
                  // Only if u r lecturer
                  //*********

                  Positioned(
                      top: size.height * 0.3 + //standard value
                          70.0 +
                          (4 * 30) //value last Positioned
                          +
                          50,
                      child: Container(
                        child: Text(
                          "Requested consultations",
                          style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: customPurple),
                        ),
                      )),
                  Positioned(
                    top: size.height * 0.3 +
                        100 + //space between tables
                        70.0 +
                        (4 * 30), // + size of last Positioned
                    child: Container(
                        width: size.width - 10,
                        height:
                            70.0 + (4 * 35), // 100 + num of consultations * 30
                        decoration: BoxDecoration(
                          color: Colors.grey[150],
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          border: Border(
                            top: BorderSide(width: 1.0, color: customPurple),
                            left: BorderSide(width: 1.0, color: customPurple),
                            right: BorderSide(width: 1.0, color: customPurple),
                            bottom: BorderSide(width: 1.0, color: customPurple),
                          ),
                        ),
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width / 3,
                                    child: Text(
                                      "Consulatation title",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 40,
                                    color: customPurple,
                                  ),
                                  Container(
                                    width: size.width / 3 - 50,
                                    child: Text(
                                      "Date",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 40,
                                    color: customPurple,
                                  ),
                                  Container(
                                    width: size.width / 3,
                                    child: Text(
                                      "Accept Deny",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                ]),
                            Container(
                                height: 3,
                                width: size.width - 10,
                                color: customPurple),
                            //num of consultationsRequest -> put in for
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width / 3,
                                    child: Text(
                                      //name of consultations from database
                                      "Consultations for design",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 30,
                                    color: customPurple,
                                  ),
                                  Container(
                                    width: size.width / 3 - 50,
                                    child: Text(
                                      //date for consultation from database
                                      "Date",
                                      style: TextStyle(
                                          fontFamily: 'datum',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 30,
                                    color: customPurple,
                                  ),
                                  Container(
                                      width: size.width / 3,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            child: Image.asset(
                                              "assets/images/accept.png",
                                              width: 30,
                                            ),
                                            onTap: () {}, //accept
                                          ),
                                          Container(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            child: Image.asset(
                                              "assets/images/deny.png",
                                              width: 30,
                                            ),
                                            onTap: () {}, //deny
                                          ),
                                        ],
                                      )),
                                ]),
                            Container(
                                height: 3,
                                width: size.width - 10,
                                color: customPurple),

                            //end of first consultation
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width / 3,
                                    child: Text(
                                      //name of consultations from database
                                      "Consultations for design",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 30,
                                    color: customPurple,
                                  ),
                                  Container(
                                    width: size.width / 3 - 50,
                                    child: Text(
                                      //date for consultation from database
                                      "Date",
                                      style: TextStyle(
                                          fontFamily: 'datum',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 30,
                                    color: customPurple,
                                  ),
                                  Container(
                                      width: size.width / 3,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            child: Image.asset(
                                              "assets/images/accept.png",
                                              width: 30,
                                            ),
                                            onTap: () {}, //accept
                                          ),
                                          Container(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            child: Image.asset(
                                              "assets/images/deny.png",
                                              width: 30,
                                            ),
                                            onTap: () {}, //deny
                                          ),
                                        ],
                                      )),
                                ]),
                            Container(
                                height: 3,
                                width: size.width - 10,
                                color: customPurple),

                            //end of second consultation
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width / 3,
                                    child: Text(
                                      //name of consultations from database
                                      "Consultations for design",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 30,
                                    color: customPurple,
                                  ),
                                  Container(
                                    width: size.width / 3 - 50,
                                    child: Text(
                                      //date for consultation from database
                                      "Date",
                                      style: TextStyle(
                                          fontFamily: 'datum',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 30,
                                    color: customPurple,
                                  ),
                                  Container(
                                      width: size.width / 3,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            child: Image.asset(
                                              "assets/images/accept.png",
                                              width: 30,
                                            ),
                                            onTap: () {}, //accept
                                          ),
                                          Container(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            child: Image.asset(
                                              "assets/images/deny.png",
                                              width: 30,
                                            ),
                                            onTap: () {}, //deny
                                          ),
                                        ],
                                      )),
                                ]),
                            Container(
                                height: 3,
                                width: size.width - 10,
                                color: customPurple),

                            //end of third consultation
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width / 3,
                                    child: Text(
                                      //name of consultations from database
                                      "Consultations for design",
                                      style: TextStyle(
                                          fontFamily: 'RoundLight',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 30,
                                    color: customPurple,
                                  ),
                                  Container(
                                    width: size.width / 3 - 50,
                                    child: Text(
                                      //date for consultation from database
                                      "Date",
                                      style: TextStyle(
                                          fontFamily: 'datum',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 30,
                                    color: customPurple,
                                  ),
                                  Container(
                                      width: size.width / 3,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            child: Image.asset(
                                              "assets/images/accept.png",
                                              width: 30,
                                            ),
                                            onTap: () {}, //accept
                                          ),
                                          Container(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            child: Image.asset(
                                              "assets/images/deny.png",
                                              width: 30,
                                            ),
                                            onTap: () {}, //deny
                                          ),
                                        ],
                                      )),
                                ]),
                            Container(
                                height: 3,
                                width: size.width - 10,
                                color: customPurple),

                            //end of fourth consultation
                          ],
                        )),
                  ),
                ]))));
  }
}
