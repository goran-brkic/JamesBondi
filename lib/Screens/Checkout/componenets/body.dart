import 'package:flutter/material.dart';
import 'package:jamesbondi/constants.dart';


class Body extends StatefulWidget {
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  "Checkout",
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
                  "Please review the information",
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
                    "Course: ", // + courseName,
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
                    "Price: ", // + price,
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
                    "Method of payment:",
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
                  padding: new EdgeInsets.fromLTRB(24, 10, 0, 9),
                  height: size.height * 0.06,
                  width: size.width * 0.55,
                  decoration: BoxDecoration(
                    color: Color(0xe5e5e5ff),
                    borderRadius: BorderRadius.circular(29),
                    border: Border.all(color: customPurple),
                  ),
                  child: Text(
                    "****  ****  ****  4852", // + credit card number substring zadnja cetiri broja
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
                if (creditCardNumber.startsWith(4)) ...[
                  child: Image.asset(
                    'assets/images/visa.png',
                    width: size.width * 0.1,
                  ),
                ],
                if (creditCardNumber.startsWith(34) || creditCardNumber.startsWith(37)) ...[
                  child: Image.asset(
                    'assets/images/americanExpress.png',
                    width: size.width * 0.1,
                  ),
                ],
                */
                if (creditCardNumber.startsWith(5)) ...[
                  child: Image.asset(
                    'assets/images/mastercard.png',
                    width: size.width * 0.1,
                  ),
                ],
              ),

              // Purchase button
              Positioned(
                top: size.height * 0.55,
                child: FlatButton(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: size.width * 0.07),
                    onPressed: () {},

                    /*
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                        */

                    color: customPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Purchase",
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
  }
}
