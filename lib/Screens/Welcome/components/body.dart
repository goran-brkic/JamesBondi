import 'package:flutter/material.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.only(
        left: 10.0,
        top: 300.0,
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              //color: Colors.blueGrey[100],
              child: Container(
                child: Text("Mail"),
              ),
            ),
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
                    borderSide: BorderSide(width: 1, color: Colors.purple[800]),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(width: 1, color: Colors.purple[800]),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 5, color: Colors.red)),
                  hintText: "mail",
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                  //errorText: 'username is already taken',
                ),
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.left),
          ),

          //drugi dio
          Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 30.0,
              ),
              //color: Colors.blueGrey[1000],
              child: Container(
                child: Text("Username"),
              ),
            ),
          ),

          Container(
            width: 250.0,
            height: 30.0,
            child: new TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xF3F3F3),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(width: 1, color: Colors.purple[800]),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(width: 1, color: Colors.purple[800]),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 5, color: Colors.red)),
                  hintText: "username",
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                  //errorText: 'username is already taken',
                ),
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.left),
          ),

          //treci dio
          Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 30.0,
              ),
              //color: Colors.blueGrey[1000],
              child: Container(
                child: Text("Password"),
              ),
            ),
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
                    borderSide: BorderSide(width: 1, color: Colors.purple[800]),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(width: 1, color: Colors.purple[800]),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 5, color: Colors.red)),
                  hintText: "password",
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                  //errorText: 'username is already taken',
                ),
                textAlignVertical: TextAlignVertical.bottom,
                textAlign: TextAlign.left),
          ),

          Container(
              padding: const EdgeInsets.only(
                top: 50.0,
              ),
              child: new OutlineButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {},
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                      width: 200.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(),
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ))))
        ],
      ),
    );
  }
}
