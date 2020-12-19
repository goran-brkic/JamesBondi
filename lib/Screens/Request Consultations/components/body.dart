import 'package:flutter/material.dart';
import 'package:jamesbondi/constants.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    dateTime = DateFormat.yMd().format(DateTime.now());
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
                  "Consultations",
                  style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 34,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.16,
                child: Text(
                  "Submit a request",
                  style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.25,
                left: size.width * 0.1,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Consultations for: ", // + lessonName,
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
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                              contentPadding: EdgeInsets.only(top: 0.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
}
