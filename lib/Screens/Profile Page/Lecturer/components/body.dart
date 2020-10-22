import 'package:flutter/material.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatefulWidget {
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Top artwork
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/images/top_part_profile.png',
                width: size.width,
              ),
            ),

            //My Profile
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.05,
              child: Text(
                "My Profile",
                style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontFamily: 'Quiglet',
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),

            // Edit icon
            Positioned(
              top: size.height * 0.05,
              right: size.width * 0.05,
              child: Image.asset(
                'assets/images/pencil.png',
                height: size.height * 0.04,
              ),
            ),

            // Profile photo
            Positioned(
              top: size.height * 0.23,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: customPurple),
                    borderRadius: BorderRadius.circular(100)),
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  fillColor: Color(0xFFF3F3F3),
                  child: Icon(
                    Icons.person,
                    size: 100.0,
                    color: Colors.black54,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ),
            ),

            // First and Last Name
            Positioned(
              top: size.height * 0.43,
              child: Text(
                'Michael Dolbey',
                style: TextStyle(
                  fontFamily: 'RoundLight',
                  fontWeight: FontWeight.normal,
                  fontSize: 22,
                  color: customPurple,
                ),
              ),
            ),

            // Type of Person
            Positioned(
              top: size.height * 0.47,
              child: Text(
                'Lecturer',
                style: TextStyle(
                  fontFamily: 'RoundLight',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),

            // About me
            Positioned(
              left: size.width * 0.12,
              top: size.height * (0.54),
              child: Text(
                "About me",
                style: TextStyle(
                  fontFamily: 'RoundLight',
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.57,
              left: size.width * 0.12,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                height: size.height * 0.2,
                width: size.width * 0.77,
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(29),
                  border: Border.all(color: customPurple),
                ),
                child: TextFormField(
                  enabled: false,
                  // controller: _aboutYController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: size.height * 0.014,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
