import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
bool signed = false;

class SignUpSection extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => SignUpState();
}

enum Person { lecturer, student }

class SignUpState extends State<SignUpSection> {
  String firstName;
  String lastName;
  String email;
  String username;
  String password;
  String creditcard;
  bool lecturer = true;
  Person _radioValue1 = Person.lecturer;
  String secCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Create An Account',
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: Text('Are you a lecturer or student?'),
                    ),
                    Text('Lecturer'),
                    Radio(
                        value: Person.lecturer,
                        groupValue: _radioValue1,
                        onChanged: (Person value) {
                          setState(() {
                            _radioValue1 = value;
                          });
                        }),
                    Text('Student'),
                    Radio(
                        value: Person.student,
                        groupValue: _radioValue1,
                        onChanged: (Person value) {
                          setState(() {
                            _radioValue1 = value;
                          });
                        }),
                  ],
                ),
                Text(
                  'First Name',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                Container(
                  width: 250.0,
                  height: 30.0,
                  child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xF3F3F3),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 5, color: Colors.red)),
                        hintText: "first name",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                        //errorText: 'username is already taken',
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      }),
                ),
                Text(
                  'Last Name',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                Container(
                    width: 250.0,
                    height: 30.0,
                    child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xF3F3F3),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.purple[800]),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.purple[800]),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 5, color: Colors.red)),
                          hintText: "last name",
                          hintStyle:
                              TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                          //errorText: 'username is already taken',
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          setState(() {
                            lastName = value;
                          });
                        })),
                Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                Container(
                  width: 250.0,
                  height: 30.0,
                  child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xF3F3F3),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 5, color: Colors.red)),
                        hintText: "email",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                        //errorText: 'username is already taken',
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      }),
                ),
                Text(
                  'Username',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                Container(
                  width: 250.0,
                  height: 30.0,
                  child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xF3F3F3),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 5, color: Colors.red)),
                        hintText: "username",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                        //errorText: 'username is already taken',
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      }),
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                Container(
                  width: 250.0,
                  height: 30.0,
                  child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xF3F3F3),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 5, color: Colors.red)),
                        hintText: "password",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                        //errorText: 'username is already taken',
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      }),
                ),
                Text(
                  'Credit Card',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                Container(
                  width: 250.0,
                  height: 30.0,
                  child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xF3F3F3),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple[800]),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(width: 5, color: Colors.red)),
                        hintText: "credit card",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                        //errorText: 'username is already taken',
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        setState(() {
                          creditcard = value;
                        });
                      }),
                ),
                Row(
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text('Expiration date'),
                      Container(
                        width: 100.0,
                        height: 30.0,
                        child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xF3F3F3),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.purple[800]),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.purple[800]),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(width: 5, color: Colors.red)),
                              hintText: "MM/YY",
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xFFB3B1B1)),
                              //errorText: 'username is already taken',
                            ),
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.left,
                            onChanged: (value) {
                              setState(() {
                                secCode = value; // promjenit OVO
                              });
                            }),
                      ),
                    ]),
                    Column(children: <Widget>[
                      Text('Security code'),
                      Container(
                        width: 100.0,
                        height: 30.0,
                        child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xF3F3F3),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.purple[800]),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.purple[800]),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(width: 5, color: Colors.red)),
                              hintText: "security code",
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xFFB3B1B1)),
                              //errorText: 'username is already taken',
                            ),
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.left,
                            onChanged: (value) {
                              setState(() {
                                secCode = value;
                              });
                            }),
                      ),
                    ]),
                  ],
                ),
              ],
            )));
  }
}
