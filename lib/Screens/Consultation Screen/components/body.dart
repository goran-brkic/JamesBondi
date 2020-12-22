import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/components/Consultation.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/components/Loading.dart';
import 'package:jamesbondi/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

bool lec;
Map<String, String> courseNames;

void getType() async {
  lec = await SharedPreferences.getInstance()
      .then((value) => value.getBool('lecturer'));
}

void getNames(var list) async {
  for (var x in list) {
    courseNames[x['courseID']] = await CoursesDB.getCourseName(x['courseID']);
  }
}

Widget schButton(var date, var courseID, var size) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    Container(
      width: size.width / 2 - 56,
      child: Text(
        //name of consultations from database
        'Consultations for ' + courseNames['courseID'],
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
        'Date',
        style: TextStyle(
            fontFamily: 'datum',
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Colors.black),
      ),
    ),
  ]);
}

Widget pendButton(var date, var courseID, var size) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    Container(
      width: size.width / 3,
      child: Text(
        //name of consultations from database
        'Consultations for ' + courseNames['courseID'],
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
        'Date',
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
                'assets/images/accept.png',
                width: 30,
              ),
              onTap: () {}, //accept
            ),
            Container(
              width: 20,
            ),
            GestureDetector(
              child: Image.asset(
                'assets/images/deny.png',
                width: 30,
              ),
              onTap: () {}, //deny
            ),
          ],
        )),
  ]);
}

class _Body extends State<Body> {
  @override
  void initState() {
    super.initState();
    getType();
  }

  @override
  Widget build(BuildContext context) {
    var pending = <Map<String, dynamic>>[];
    var scheduled = <Map<String, dynamic>>[];
    var unapproved = <Map<String, dynamic>>[];
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: ConsultationDB.getConsultations(
            FirebaseAuth.instance.currentUser.email),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          Widget children;
          !snapshot.hasData
              ? children = loadingBar()
              : {
                  getNames(snapshot.data),
                  for (Map<String, dynamic> x in snapshot.data)
                    {
                      if (x['studentConfirm'].toString() == 'true' &&
                          x['lecturerConfirm'].toString() == 'true')
                        {scheduled.add(x)}
                      else if (x['studentConfirm'].toString() == 'true' &&
                          x['lecturerConfirm'].toString() == 'false')
                        {
                          if (lec) {pending.add(x)} else {unapproved.add(x)}
                        }
                      else if (x['studentConfirm'].toString() == 'false' &&
                          x['lecturerConfirm'].toString() == 'true')
                        {
                          if (lec) {unapproved.add(x)} else {pending.add(x)}
                        }
                    },
                  children = SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Form(
                          child: Container(
                              height: size.height,
                              width: double.infinity,
                              child:
                                  Stack(alignment: Alignment.center, children: <
                                      Widget>[
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
                                    top: size.height * 0.245,
                                    child: Container(
                                      child: Text(
                                        'Scheduled consultations',
                                        style: TextStyle(
                                            fontFamily: 'RoundLight',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: customPurple),
                                      ),
                                    )),
                                Positioned(
                                  top: size.height * 0.3,
                                  child: Container(
                                    width: size.width - 10,
                                    height: 20.0 +
                                        (scheduled.length *
                                            30), // 100 + num of consultations * 30
                                    child: scheduled.isEmpty
                                        ? Text('NONE')
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: scheduled.length,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return schButton(
                                                  scheduled[index]['reqDate'],
                                                  scheduled[index]['courseID'],
                                                  size);
                                            }),
                                  ),
                                ),

                                //*********
                                // Only if u r lecturer
                                //*********

                                Positioned(
                                    top: size.height * 0.35 + //standard value
                                        (pending.length *
                                            30), //value last Positioned,
                                    child: Container(
                                      child: Text(
                                        'Consultations awaiting your approval',
                                        style: TextStyle(
                                            fontFamily: 'RoundLight',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: customPurple),
                                      ),
                                    )),
                                Positioned(
                                  top: size.height * 0.4 +
                                      (pending.length *
                                          30), // + size of last Positioned
                                  child: Container(
                                    width: size.width - 10,
                                    height: 20.0 +
                                        (pending.length *
                                            30), // 100 + num of consultations * 30
                                    child: pending.isEmpty
                                        ? Text('NONE')
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: pending.length,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return pendButton(
                                                  pending[index]['reqDate'],
                                                  pending[index]['courseID'],
                                                  size);
                                            }),
                                  ),
                                ),
                                Positioned(
                                    top: size.height * 0.36 + //standard value
                                        (unapproved.length *
                                            30), //value last Positioned,
                                    child: Container(
                                      child: Text(
                                        'Requested consultations',
                                        style: TextStyle(
                                            fontFamily: 'RoundLight',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: customPurple),
                                      ),
                                    )),
                                Positioned(
                                  top: size.height * 0.41 +
                                      (unapproved.length * 30),
                                  child: Container(
                                    width: size.width - 10,
                                    height: unapproved.length *
                                        40.0, // 100 + num of consultations * 30
                                    child: unapproved.isEmpty
                                        ? Text('NONE')
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: unapproved.length,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return schButton(
                                                  unapproved[index]['reqDate'],
                                                  unapproved[index]['courseID'],
                                                  size);
                                            }),
                                  ),
                                ),
                              ]))))
                };
          return children;
        });
  }
}
