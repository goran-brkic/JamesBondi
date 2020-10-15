import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
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
                Row(children: <Widget>[
                  Text(
                    'Are you a lecturer or a student?',
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                  Radio(
                    value: 1,
                    groupValue: 1,
//                    onChanged: _handleRadioValueChange1,
                  ),
                  Text(
                    'Lecturer',
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                  Radio(
                    value: 0,
                    groupValue: 1,
//                    onChanged: _handleRadioValueChange1,
                  ),
                  Text(
                    'Student',
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )
                ]),
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
                      textAlign: TextAlign.left),
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
                        hintText: "last name",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                        //errorText: 'username is already taken',
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.left),
                ),
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
                        hintText: "last name",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                        //errorText: 'username is already taken',
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                      textAlign: TextAlign.left),
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
                      textAlign: TextAlign.left),
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
                      textAlign: TextAlign.left),
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
                      textAlign: TextAlign.left),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Expiration date',
                      ),
                    ),
                    Container()
                  ],
                )
              ],
            )));
  }
}
