import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/JoinChannel/join_screen.dart';
import 'package:jamesbondi/Screens/Request%20Consultations/req_new_cons.dart';
import 'package:jamesbondi/components/Consultation.dart';
import 'package:jamesbondi/components/Result.dart';
import 'package:jamesbondi/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

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

class _Body extends State<Body> {
  @override
  void initState() {
    super.initState();
    getType();
  }

  var pending = <Map<String, dynamic>>[];
  var scheduled = <Map<String, dynamic>>[];
  var unapproved = <Map<String, dynamic>>[];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      Container(
        height: size.height * 0.2,
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
            top: size.height * 0.16,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pending.clear();
                  unapproved.clear();
                  scheduled.clear();
                });
              },
              child: Text(
                'REFRESH',
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 26,
                    color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
      Container(
        height: size.height * 0.6,
        width: size.width,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Center(
              child: Text(
                'Scheduled consultations',
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: customPurple),
              ),
            ),
            Center(
              child: Text(
                'Press consultations to enter video call',
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: customPurple),
              ),
            ),
            FutureBuilder(
                future: ConsultationDB.getSchConsultations(
                    FirebaseAuth.instance.currentUser.email, lec),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  Widget children;
                  !snapshot.hasData
                      ? children = Text('')
                      : children = ListView.builder(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return schButton(snapshot.data[index]['reqDate'],
                                size, snapshot.data[index]['meetID']);
                          });
                  return children;
                }),
            Center(
              child: Text(
                'Consultations awaiting approval',
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: customPurple),
              ),
            ),
            FutureBuilder(
                future: ConsultationDB.getPendConsultations(
                    FirebaseAuth.instance.currentUser.email, lec),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  Widget children;
                  !snapshot.hasData
                      ? children = Text('')
                      : children = ListView.builder(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return pendButton(
                                snapshot.data[index]['reqDate'],
                                size,
                                snapshot.data[index]['courseID'],
                                snapshot.data[index]['meetID']);
                          });
                  return children;
                }),
            Center(
              child: Text(
                'Requested consultations',
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: customPurple),
              ),
            ),
            FutureBuilder(
                future: ConsultationDB.getUnappConsultations(
                    FirebaseAuth.instance.currentUser.email, lec),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  Widget children;
                  !snapshot.hasData
                      ? children = Text('')
                      : children = ListView.builder(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return schButton1(
                                snapshot.data[index]['reqDate'], size);
                          });
                  return children;
                }),
          ],
        ),
      ),
    ]);

    /*
    return FutureBuilder(
        future: ConsultationDB.getConsultations(
            FirebaseAuth.instance.currentUser.email),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          Widget children;
          !snapshot.hasData
              ? children = loadingBar()
              : {
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
                  children = Column(children: <Widget>[
                    Container(
                      height: size.height * 0.2,
                      child:
                          Stack(alignment: Alignment.center, children: <Widget>[
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
                          top: size.height * 0.16,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                pending.clear();
                                unapproved.clear();
                                scheduled.clear();
                              });
                            },
                            child: Text(
                              'REFRESH',
                              style: TextStyle(
                                  fontFamily: 'RoundLight',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 26,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      height: size.height * 0.6,
                      width: size.width,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Scheduled consultations',
                              style: TextStyle(
                                  fontFamily: 'RoundLight',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: customPurple),
                            ),
                          ),
                          scheduled.isEmpty
                              ? Text('')
                              : ListView.builder(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  shrinkWrap: true,
                                  itemCount: scheduled.length - 1,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return schButton(
                                        scheduled[index]['reqDate'],
                                        size,
                                        scheduled[index]['meetID']);
                                  }),
                          Center(
                            child: Text(
                              'Consultations awaiting your approval',
                              style: TextStyle(
                                  fontFamily: 'RoundLight',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: customPurple),
                            ),
                          ),
                          pending.isEmpty
                              ? Text('')
                              : ListView.builder(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  shrinkWrap: true,
                                  itemCount: pending.length - 1,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return pendButton(
                                        pending[index]['reqDate'],
                                        size,
                                        pending[index]['courseID'],
                                        pending[index]['meetID']);
                                  }),
                          Center(
                            child: Text(
                              'Requested consultations',
                              style: TextStyle(
                                  fontFamily: 'RoundLight',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: customPurple),
                            ),
                          ),
                          unapproved.isEmpty
                              ? Text('')
                              : ListView.builder(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  shrinkWrap: true,
                                  itemCount: unapproved.length - 1,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return schButton1(
                                        unapproved[index]['reqDate'], size);
                                  }),
                        ],
                      ),
                    ),
                  ])
                };

          return children;
        });
        */
  }

  Widget schButton1(var date, var size) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        width: size.width / 3,
        child: Text(
          //name of consultations from database
          'Consultations',
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
          DateFormat('dd.MM  HH:mm').format(date.toDate()),
          style: TextStyle(
              fontFamily: 'datum',
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Colors.black),
        ),
      ),
    ]);
  }

  Widget schButton(var date, var size, var meetID) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => JoinScreen(meetID, lec)));
      },
      child: Container(
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
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            width: size.width / 2 - 56,
            child: Text(
              //name of consultations from database
              'Consultations',
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
              DateFormat('dd.MM  HH:mm').format(date.toDate()),
              style: TextStyle(
                  fontFamily: 'datum',
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }

  Widget pendButton(var date, var size, var courseID, var meetID) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        width: size.width / 3,
        child: Text(
          //name of consultations from database
          'Consultations',
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
        width: size.width / 4,
        child: Text(
          //date for consultation from database
          DateFormat('dd.MM  HH:mm').format(date.toDate()),
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
                onTap: () async {
                  if (lec) {
                    await ConsultationDB.confirmConsultationsLecturer(meetID);
                    setState(() {
                      //Future.delayed(Duration(milliseconds: 200));
                    });
                  } else {
                    await ConsultationDB.confirmConsultationsStudent(meetID);
                    setState(() {
                      //Future.delayed(Duration(milliseconds: 200));
                    });
                  }
                }, //accept
              ),
              Container(
                width: 20,
              ),
              GestureDetector(
                child: Image.asset(
                  'assets/images/deny.png',
                  width: 30,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          RequestNewConsultationsScreen(meetID)));
                }, //deny
              ),
            ],
          )),
    ]);
  }
}
/*
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
                                  top: size.height * 0.25,
                                  child: Container(
                                    width: size.width - 10,
                                    height: (scheduled.length *
                                        30.0), // 100 + num of consultations * 30
                                    child: scheduled.isEmpty
                                        ? Text('')
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: scheduled.length - 1,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return schButton(
                                                  scheduled[index]['reqDate'],
                                                  size);
                                            }),
                                  ),
                                ),


                                Positioned(
                                    top: size.height * 0.3 + //standard value
                                        //70.0 +
                                        (scheduled.length *
                                            10), //value last Positioned,
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
                                  top: size.height * 0.31 + //standard value
                                      //70.0 +
                                      (scheduled.length *
                                          10), // + size of last Positioned
                                  child: Container(
                                    width: size.width - 10,
                                    height: 10.0 +
                                        (pending.length *
                                            30.0), // 100 + num of consultations * 30
                                    child: pending.isEmpty
                                        ? Text('')
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: pending.length - 1,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return pendButton(
                                                  pending[index]['reqDate'],
                                                  size,
                                                  pending[index]['courseID'],
                                                  pending[index]['meetID']);
                                            }),
                                  ),
                                ),
                                Positioned(
                                    top: size.height * 0.35 + //standard value
                                        (pending.length * 30) +
                                        (scheduled.length *
                                            30), //value last Positioned
                                    //value last Positioned,
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
                                  top: size.height * 0.36 + //standard value
                                      (pending.length * 30) +
                                      (scheduled.length * 30),
                                  child: Container(
                                    width: size.width - 10,
                                    height: 10.0 +
                                        (unapproved.length *
                                            30.0), // 100 + num of consultations * 30
                                    child: unapproved.isEmpty
                                        ? Text('')
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: unapproved.length - 1,
                                            itemBuilder:
                                                (BuildContext ctxt, int index) {
                                              return schButton(
                                                  unapproved.elementAt(
                                                      index)['reqDate'],
                                                  size);
                                            }),
                                  ),
                                ),
                              ]))))
                };
          return children;
        });
  }
  */
