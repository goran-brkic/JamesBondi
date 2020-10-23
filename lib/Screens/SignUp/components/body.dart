import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Student/profile_page_S.dart';
import 'package:jamesbondi/Screens/Welcome/welcome_screen.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/constants.dart';
import '../../../components/addUser.dart';
import 'package:image_picker/image_picker.dart';
import '../../../components/uploadImage.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
bool signed = false;
RegExp expDateRegex = RegExp(r'^[0,1]?\d{1}\/(([0-2]?\d{1}/))');

enum Person { lecturer, student }

class Body extends StatefulWidget {
  String emailAddressInput;
  String usernameInput;

  Body({@required this.emailAddressInput, @required this.usernameInput});

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
  String imageURL;
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
        if (lecturer) {
          addLecturer(
                  _usernameController.text,
                  _emailController.text,
                  _firstNameController.text,
                  _lastNameController.text,
                  _ibanController.text,
                  _aboutYController.text,
                  imageURL)
              .then((value) => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LProfileScreen(user))));
        } else {
          addStudent(
                  _usernameController.text,
                  _emailController.text,
                  _firstNameController.text,
                  _lastNameController.text,
                  _creditcardController.text,
                  _expirationDateController.text,
                  _secCodeController.text)
              .then((value) => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SProfileScreen(user))));
        }
      });
    } else {
      setState(() {
        _success = false;
        _firstNameController.clear();
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  File _image;
  String _uploadedFileURL;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  bool isFirstNameEmpty = false;
  bool isLastNameEmpty = false;
  bool isPasswordEmpty = false;
  bool isIbanEmpty = false;
  bool isCreditCardEmpty = false;
  bool isSecCodeEmpty = false;
  bool isExpDateEmpty = false;

  @override
  Widget build(BuildContext context) {
    _emailController.text = widget.emailAddressInput;
    _usernameController.text = widget.usernameInput;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          height: size.height * (lecturer ? 1.6 : 1.15),
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
                enabledField: true,
                colorValue: isFirstNameEmpty ? Colors.red : customPurple,
              ),
              InputField(
                title: "Last name",
                topValue: 0.37,
                controller: _lastNameController,
                enabledField: true,
                colorValue: isLastNameEmpty ? Colors.red : customPurple,
              ),
              InputField(
                title: "Email",
                topValue: 0.49,
                controller: _emailController,
                enabledField: false,
                colorValue: customPurple,
              ),
              InputField(
                title: "Username",
                topValue: 0.61,
                controller: _usernameController,
                enabledField: false,
                colorValue: customPurple,
              ),
              InputField(
                title: "Password",
                topValue: 0.73,
                controller: _passwordController,
                enabledField: true,
                colorValue: isPasswordEmpty ? Colors.red : customPurple,
              ),
              if (!lecturer) ...[
                InputField(
                  title: "Credit card",
                  topValue: 0.85,
                  controller: _creditcardController,
                  enabledField: true,
                  colorValue: isCreditCardEmpty ? Colors.red : customPurple,
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
                      border: Border.all(
                          color: isExpDateEmpty ? Colors.red : customPurple),
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
                      border: Border.all(
                          color: isSecCodeEmpty ? Colors.red : customPurple),
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
                  top: size.height * 1.05,
                  child: FlatButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: size.width * 0.07),
                      onPressed: () {
                        isFirstNameEmpty = _firstNameController.text.isEmpty;
                        isLastNameEmpty = _lastNameController.text.isEmpty;
                        isCreditCardEmpty = _creditcardController.text.isEmpty;
                        isExpDateEmpty = _expirationDateController.text.isEmpty;
                        isPasswordEmpty = _passwordController.text.isEmpty;
                        isSecCodeEmpty = _secCodeController.text.isEmpty;
                        if (isFirstNameEmpty ||
                            isCreditCardEmpty ||
                            isExpDateEmpty ||
                            isLastNameEmpty ||
                            isPasswordEmpty ||
                            isSecCodeEmpty) {
                          setState(() {
                            isFirstNameEmpty = isFirstNameEmpty;
                            isCreditCardEmpty = isCreditCardEmpty;
                            isExpDateEmpty = isExpDateEmpty;
                            isLastNameEmpty = isLastNameEmpty;
                            isPasswordEmpty = isPasswordEmpty;
                            isSecCodeEmpty = isSecCodeEmpty;
                          });
                        } else if (_formKey.currentState.validate()) {
                          _register();
                        }

                        /*
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                        */
                      },
                      color: customPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Create Account",
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
                  enabledField: true,
                  colorValue: isIbanEmpty ? Colors.red : customPurple,
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
                  top: size.height * 0.99,
                  left: size.height * 0.07,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: customPurple),
                        borderRadius: BorderRadius.circular(100)),
                    child: RawMaterialButton(
                      onPressed: () async {
                        await getImage();
                        imageURL = await uploadFile(_image);
                        print(imageURL);
                      },
                      elevation: 0,
                      fillColor: Color(0xFFF3F3F3),
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  alignment: Alignment.center,
                                  child: Image.file(_image)))
                          : Icon(
                              Icons.upload_outlined,
                              size: 60.0,
                            ),
                      padding: _image != null
                          ? EdgeInsets.all(0.0)
                          : EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
                /*
                Positioned(
                    top: size.height * 0.99,
                    left: size.height * 0.25,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            width: 100.0,
                            height: 100.0,
                            alignment: Alignment.center,
                            child: _image != null
                                ? Image.file(_image)
                                : Container()))),
                */

                // About me
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
                Positioned(
                  top: size.height * 1.48,
                  child: FlatButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: size.width * 0.07),
                      onPressed: () {
                        isFirstNameEmpty = _firstNameController.text.isEmpty;
                        isLastNameEmpty = _lastNameController.text.isEmpty;
                        isIbanEmpty = _ibanController.text.isEmpty;
                        isPasswordEmpty = _passwordController.text.isEmpty;

                        if (isFirstNameEmpty ||
                            isIbanEmpty ||
                            isLastNameEmpty ||
                            isPasswordEmpty) {
                          setState(() {
                            isFirstNameEmpty = isFirstNameEmpty;
                            isIbanEmpty = isIbanEmpty;
                            isLastNameEmpty = isLastNameEmpty;
                            isPasswordEmpty = isPasswordEmpty;
                          });
                        } else if (_formKey.currentState.validate()) {
                          _register();
                        }

                        /*
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));

                        */
                      },
                      color: customPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                ),
              ],
            ],
          ),
        ),
      ),
    ));
  }
}
