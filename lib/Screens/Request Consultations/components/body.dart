import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/components/Consultation.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/constants.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  String cat;
  String dif;
  String courseID;
  Body(this.cat, this.dif, this.courseID);
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, ' ', am]).toString();
      });
    }
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, ' ', am]).toString();
    super.initState();
  }

  Future<void> _showDialog(var context) async {
    return showDialog<void>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter a date after now!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return FutureBuilder(
        future: CoursesDB.getCourse(widget.cat, widget.dif, widget.courseID),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasError) {
            return Container();
          } else if (!snapshot.hasData) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: Center(child: Image.asset('assets/images/loader.gif')));
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
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
                        top: size.height * 0.14,
                        child: Image.asset(
                          'assets/images/Line 1.png',
                          width: size.width * 0.7,
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.075,
                        child: Text(
                          'Consultations',
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 34,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.45,
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: size.width * 0.07),
                          onPressed: () async {
                            if (DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    selectedTime.hour,
                                    selectedTime.minute)
                                .isBefore(DateTime.now())) {
                              selectedDate = DateTime.now();
                              selectedTime = TimeOfDay.now();
                              _timeController.text = formatDate(
                                  DateTime(2019, 08, 1, DateTime.now().hour,
                                      DateTime.now().minute),
                                  [hh, ':', nn, ' ', am]).toString();
                              await _showDialog(context);
                            } else {
                              await ConsultationDB.createConsRequest(
                                  widget.courseID,
                                  FirebaseAuth.instance.currentUser.email,
                                  snapshot.data['courseMail'],
                                  DateTime(
                                      selectedDate.year,
                                      selectedDate.month,
                                      selectedDate.day,
                                      selectedTime.hour,
                                      selectedTime.minute),
                                  true,
                                  false);
                              Navigator.of(context).pop();
                            }
                          },
                          color: customPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Submit a request',
                            style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.normal,
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.25,
                        left: size.width * 0.1,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Consultations for: ' + snapshot.data['courseName'],
                            style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // odabir datuma
                      Positioned(
                        top: size.height * 0.3,
                        left: size.width * 0.1,
                        child: Stack(
                          children: <Widget>[
                            Text(
                              'Choose Date',
                              style: TextStyle(
                                fontFamily: 'RoundLight',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: Container(
                                width: size.width * 0.35,
                                height: size.height * 0.075,
                                margin: EdgeInsets.only(top: 30),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: customPurple,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'RoundLight',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  controller: _dateController,
                                  onSaved: (String val) {
                                    _setDate = val;
                                  },
                                  decoration: InputDecoration(
                                      disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      // labelText: 'Time',
                                      contentPadding:
                                          EdgeInsets.only(top: 0.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // odabir vremena
                      Positioned(
                        top: size.height * 0.3,
                        left: size.width * 0.5,
                        child: Stack(
                          children: <Widget>[
                            Text(
                              'Choose Time',
                              style: TextStyle(
                                fontFamily: 'RoundLight',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _selectTime(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
                                width: size.width * 0.35,
                                height: size.height * 0.075,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: customPurple,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'RoundLight',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  onSaved: (String val) {
                                    _setTime = val;
                                  },
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  controller: _timeController,
                                  decoration: InputDecoration(
                                      disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      // labelText: 'Time',
                                      contentPadding: EdgeInsets.all(5)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
