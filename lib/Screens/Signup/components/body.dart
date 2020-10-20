import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Welcome/welcome_screen.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/roundedButton.dart';
import 'package:jamesbondi/constants.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
bool signed = false;

enum Person { lecturer, student }

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  bool lecturer = true;
  Person _radioValue1 = Person.lecturer;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _creditcardController = TextEditingController();
  final TextEditingController _expirationDateController =
      TextEditingController();
  final TextEditingController _secCodeController = TextEditingController();
  final TextEditingController _ibanController = TextEditingController();
  final TextEditingController _aboutYController = TextEditingController();
  bool _success;
  String _userEmail;

  void _register() async {
    final User user = (await auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        signed = true;
        _success = true;
        _userEmail = user.email;
        user.sendEmailVerification();
//      addLecturer('test', user.email, null, 'Testno', 'Ime', 'Moneyyyy');
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 1.5,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: size.height * 0.07,
                child: Text(
                  'Create An Account',
                  style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontFamily: 'Quiglet',
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: customPurple,
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.12,
                child: Image.asset(
                  'assets/images/Spacer_createAcc.png',
                  width: size.width * 0.7,
                ),
              ),
              Positioned(
                top: size.height * 0.13,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Are you a lecturer or student?',
                        style: TextStyle(
                          fontFamily: 'RoundLight',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: customPurple,
                        ),
                      ),
                    ),
                    Text(
                      'Lecturer',
                      style: TextStyle(
                        fontFamily: 'RoundLight',
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                    ),
                    Radio(
                        value: Person.lecturer,
                        groupValue: _radioValue1,
                        onChanged: (Person value) {
                          setState(() {
                            lecturer = true;
                            _radioValue1 = value;
                          });
                        }),
                    Text(
                      'Student',
                      style: TextStyle(
                        fontFamily: 'RoundLight',
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                    ),
                    Radio(
                        value: Person.student,
                        groupValue: _radioValue1,
                        onChanged: (Person value) {
                          setState(() {
                            lecturer = false;
                            _radioValue1 = value;
                          });
                        }),
                  ],
                ),
              ),
              InputField(
                title: "First name",
                topValue: 0.25,
                controller: _firstNameController,
              ),
              InputField(
                title: "Last name",
                topValue: 0.37,
                controller: _lastNameController,
              ),
              InputField(
                title: "Email",
                topValue: 0.49,
                controller: _emailController,
              ),
              InputField(
                title: "Username",
                topValue: 0.61,
                controller: _usernameController,
              ),
              InputField(
                title: "Password",
                topValue: 0.73,
                controller: _passwordController,
              ),
              if (!lecturer) ...[
                InputField(
                  title: "Credit card",
                  topValue: 0.85,
                  controller: _creditcardController,
                ),
                Positioned(
                  top: size.height * 0.97,
                  left: size.width * 0.12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    height: size.height * 0.06,
                    width: size.width * 0.26,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(29),
                      border: Border.all(color: customPurple),
                    ),
                    child: TextFormField(
                      controller: _expirationDateController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "MM/YY",
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
                Positioned(
                  left: size.width * 0.12,
                  top: size.height * (0.97 - 0.035),
                  child: Text(
                    "Expiration date",
                    style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.97,
                  left: size.width * 0.42,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    height: size.height * 0.06,
                    width: size.width * 0.26,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(29),
                      border: Border.all(color: customPurple),
                    ),
                    child: TextFormField(
                      controller: _secCodeController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "XXX",
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
                Positioned(
                  left: size.width * 0.42,
                  top: size.height * (0.97 - 0.035),
                  child: Text(
                    "Security code",
                    style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.87,
                  child: FlatButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: size.width * 0.07),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                      },
                      color: customPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                ),
              ],
              if (lecturer) ...[
                InputField(
                  title: "IBAN",
                  topValue: 0.85,
                  controller: _ibanController,
                ),
                Positioned(
                  left: size.width * 0.12,
                  top: size.height * (0.97 - 0.035),
                  child: Text(
                    "Image",
                    style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 1.2,
                  left: size.width * 0.12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    height: size.height * 0.25,
                    width: size.width * 0.77,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(29),
                      border: Border.all(color: customPurple),
                    ),
                    child: TextFormField(
                      controller: _aboutYController,
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
                Positioned(
                  left: size.width * 0.12,
                  top: size.height * (1.2 - 0.035),
                  child: Text(
                    "About yourself",
                    style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
