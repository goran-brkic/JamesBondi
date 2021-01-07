import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Categories%20Page/categories_screen.dart';
import 'package:jamesbondi/Screens/Categories%20Page/components/body2.dart';
import 'package:jamesbondi/components/Result.dart';
import 'package:jamesbondi/components/userInfo.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatefulWidget {
  final course;
  Body(this.course);
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  Future<void> _showConfirmDialog(var context) {
    return showDialog<bool>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                'Successfully bought course ' + widget.course['courseName']),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoriesScreen()));
                  },
                  child: Text('Back to home screen'))
            ],
          );
        },
        context: context);
  }

  Future<void> _showFailedDialog(var context) {
    return showDialog<bool>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                'Failed to complete payment! Please review your card info'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget cardChild(String creditCardNumber) {
      if (creditCardNumber.startsWith('4')) {
        return Image.asset(
          'assets/images/visa.png',
          width: size.width * 0.1,
        );
      } else if (creditCardNumber.startsWith('34') ||
          creditCardNumber.startsWith('37')) {
        return Image.asset(
          'assets/images/americanExpress.png',
          width: size.width * 0.1,
        );
      } else if (creditCardNumber.startsWith('5')) {
        return Image.asset(
          'assets/images/mastercard.png',
          width: size.width * 0.1,
        );
      } else {
        return Image.asset(
          'assets/images/visa.png',
          width: size.width * 0.1,
        );
      }
    }

    return FutureBuilder(
        future: UserInfoDB.getUserInfo(FirebaseAuth.instance.currentUser.email),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return loadingBar();
          } else if (snapshot.hasData) {
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
                        top: size.height * 0.155,
                        child: Image.asset(
                          'assets/images/Line 1.png',
                          width: size.width * 0.7,
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.085,
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.24,
                        left: size.width * 0.1,
                        child: Text(
                          'Please review the information',
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      // Bijela pozadina podataka
                      Positioned(
                        top: size.height * 0.295,
                        left: size.width * 0.1,
                        child: Container(
                          height: size.height * 0.24,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F3F3),
                            borderRadius: BorderRadius.circular(29),
                            border: Border.all(color: customPurple),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.31,
                        left: size.width * 0.15,
                        child: Text(
                          'Course: ' +
                              widget.course['courseName'], // + courseName,
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.36,
                        left: size.width * 0.15,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Price: ' +
                                widget.course['coursePrice'].toString() +
                                ' HRK', // + price,
                            style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.normal,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.41,
                        left: size.width * 0.15,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Method of payment:',
                            style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.normal,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // kartica
                      Positioned(
                        top: size.height * 0.46,
                        left: size.width * 0.15,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(24, 10, 0, 9),
                          height: size.height * 0.06,
                          width: size.width * 0.55,
                          decoration: BoxDecoration(
                            color: Color(0xe5e5e5ff),
                            borderRadius: BorderRadius.circular(29),
                            border: Border.all(color: customPurple),
                          ),
                          child: Text(
                            '****  ****  **** ' +
                                snapshot.data['creditCard'].substring(
                                    snapshot.data['creditCard'].length - 4,
                                    snapshot.data['creditCard']
                                        .length), // + credit card number substring zadnja cetiri broja
                            // var string = 'dartlang';
                            // string.substring(1);    // 'artlang'
                            // string.substring(1, 4); // 'art

                            style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.normal,
                              fontSize: 21,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // credit card icon
                      Positioned(
                        top: size.height * 0.46,
                        left: size.width * 0.73,
                        child: cardChild(snapshot.data['creditCard']),
                      ),

                      // Purchase button
                      Positioned(
                        top: size.height * 0.55,
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: size.width * 0.07),
                            onPressed: () async {
                              if (Random().nextInt(100) < 90) {
                                //print('Successfully bought course with ID ' +
                                //widget.course['courseID'].toString());
                                await UserInfoDB.addCourse(
                                    FirebaseAuth.instance.currentUser.email,
                                    widget.course['courseID']);
                                _showConfirmDialog(context);
                              } else {
                                _showFailedDialog(context);
                                //print('FAILED TO BUY');
                              }
                            },
                            color: customPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'Purchase',
                              style: TextStyle(
                                  fontFamily: 'RoundLight',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Column(children: <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ]);
          }
        });
  }
}
