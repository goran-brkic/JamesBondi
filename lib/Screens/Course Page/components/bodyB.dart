import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/List%20Courses%20Page/list_courses_screen.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/Screens/Request%20Consultations/request_consulations.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/constants.dart';

class BodyBought extends StatefulWidget {
  String id;
  String cat;
  String dif;
  BodyBought(String cat, String dif, String id) {
    this.cat = cat;
    this.dif = dif;
    this.id = id;
  }
  _Body createState() => _Body(this.cat, this.dif, this.id);
}

class _Body extends State<BodyBought> {
  String courseID;
  String courseCat;
  String courseDif;
  _Body(String cat, String dif, String id) {
    courseCat = cat;
    courseDif = dif;
    courseID = id;
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: CoursesDB.getCourse(courseID),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          Widget children;
          children = SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
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
                      snapshot.hasData
                          ? snapshot.data['courseName']
                          : "LOADING",
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                LProfileScreen(snapshot.data['courseMail'])));
                      },
                      child: Text(
                        snapshot.hasData
                            ? snapshot.data['courseMail']
                            : "LOADING",
                        style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 26,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  /*
                  Positioned(
                    top: size.height * 0.24,
                    child: Text(
                      snapshot.hasData
                          ? snapshot.data['coursePrice'].toString() + " HRK"
                          : "",
                      style: TextStyle(
                          fontFamily: 'RoundLight',
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                          color: customPurple),
                    ),
                  ),
                  */

                  //User nije kupio tecaj  ->>cijeli zakomentirani, treba stavit if pa onda jedno il drugo
                  /*
                  Positioned(
                    top: size.height * 0.3,
                    child: Container(
                      //color: Colors.grey[800],
                      width: size.width - 10,
                      height: size.height / 2,
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
                      child: Text(
                          snapshot.hasData ? snapshot.data['courseInfo'] : "",
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.83,
                    height: 50,
                    width: 200,
                    child: FlatButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: size.width * 0.07),
                        onPressed: () {},
                        color: customPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          snapshot.hasData ? "BUY" : "LOADING",
                          style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                  ),
                   */

                  //ako user je vec kupio tecaj
                  Positioned(
                    top: size.height * 0.27,
                    child: Container(
                      width: size.width - 10,
                      height: size.height / 4,
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
                      child: Text(
                          snapshot.hasData ? snapshot.data['courseInfo'] : "",
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.55,
                    child: Container(
                      width: size.width - 10,
                      height: size.height / 4,
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Materials",
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: customPurple,
                          )),
                    ),
                  ),

                  Positioned(
                    top: size.height * 0.6,
                    child: Container(
                        width: size.width,
                        height: size.height / 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[150],
                          border: Border(
                            top: BorderSide(width: 1.0, color: customPurple),
                            bottom: BorderSide(width: 1.0, color: customPurple),
                          ),
                        ),
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //vuci materijale kao slike i tekst(stavit cemo deafult sliku za pdf npr)
                              GestureDetector(
                                onTap: () {
                                  //download file ?
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[150],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      border: Border(
                                        top: BorderSide(
                                            width: 1.0, color: customPurple),
                                        left: BorderSide(
                                            width: 1.0, color: customPurple),
                                        right: BorderSide(
                                            width: 1.0, color: customPurple),
                                        bottom: BorderSide(
                                            width: 1.0, color: customPurple),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          //ucitaj iz "bp"
                                          "assets/images/pdf.png",
                                          height: size.height / 7,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(
                                              //ime iz baze, mozemo ogranicit na nekolko charova ?
                                              "material1",
                                              style: TextStyle(
                                                  fontFamily: 'RoundLight',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 5),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[150],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      border: Border(
                                        top: BorderSide(
                                            width: 1.0, color: customPurple),
                                        left: BorderSide(
                                            width: 1.0, color: customPurple),
                                        right: BorderSide(
                                            width: 1.0, color: customPurple),
                                        bottom: BorderSide(
                                            width: 1.0, color: customPurple),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/pdf.png",
                                          height: size.height / 7,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text("material2",
                                              style: TextStyle(
                                                  fontFamily: 'RoundLight',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 5),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[150],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      border: Border(
                                        top: BorderSide(
                                            width: 1.0, color: customPurple),
                                        left: BorderSide(
                                            width: 1.0, color: customPurple),
                                        right: BorderSide(
                                            width: 1.0, color: customPurple),
                                        bottom: BorderSide(
                                            width: 1.0, color: customPurple),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/pdf.png",
                                          height: size.height / 7,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text("material3",
                                              style: TextStyle(
                                                  fontFamily: 'RoundLight',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 5),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[150],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      border: Border(
                                        top: BorderSide(
                                            width: 1.0, color: customPurple),
                                        left: BorderSide(
                                            width: 1.0, color: customPurple),
                                        right: BorderSide(
                                            width: 1.0, color: customPurple),
                                        bottom: BorderSide(
                                            width: 1.0, color: customPurple),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/pdf.png",
                                          height: size.height / 7,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text("material4",
                                              style: TextStyle(
                                                  fontFamily: 'RoundLight',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[150],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      border: Border(
                                        top: BorderSide(
                                            width: 1.0, color: customPurple),
                                        left: BorderSide(
                                            width: 1.0, color: customPurple),
                                        right: BorderSide(
                                            width: 1.0, color: customPurple),
                                        bottom: BorderSide(
                                            width: 1.0, color: customPurple),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/mp4.png",
                                          height: size.height / 7,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text("material5",
                                              style: TextStyle(
                                                  fontFamily: 'RoundLight',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),

                  Positioned(
                    top: size.height * 0.88,
                    height: 50,
                    width: 300,
                    child: FlatButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: size.width * 0.07),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RequestConsultationsScreen(
                                  widget.cat, widget.dif, widget.id)));
                        },
                        color: customPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          snapshot.hasData ? "Ask for consultation" : "LOADING",
                          style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                  ),
                  //zavrsava dio gdje je korisnik ulogiran
                ],
              ),
            ),
          ));
          return children;
        });
  }
}
