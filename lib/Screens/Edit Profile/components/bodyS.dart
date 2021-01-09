import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/userInfo.dart';
import 'package:jamesbondi/constants.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
bool signed = false;
RegExp expDateRegex = RegExp(r'^[0,1]?\d{1}\/(([0-2]?\d{1}/))');

enum Person { lecturer, student }

class BodyS extends StatefulWidget {
  final String emailAddressInput;

  BodyS(this.emailAddressInput);

  @override
  _Body createState() => _Body();
}

class _Body extends State<BodyS> {
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

  Future<void> getUser(String mail) async {
    var map = await UserInfoDB.getUserInfo(mail);
    _firstNameController.text = map['firstName'];
    _lastNameController.text = map['lastName'];
    _emailController.text = mail;
    _usernameController.text = map['username'];
    _creditcardController.text = map['creditCard'];
    _expirationDateController.text = map['cardExp'];
    _secCodeController.text = map['secCode'];
  }

  @override
  initState() {
    getUser(widget.emailAddressInput);
    super.initState();
  }

  void _register() async {
    UserInfoDB.updateStudent(
            widget.emailAddressInput,
            _firstNameController.text,
            _lastNameController.text,
            _creditcardController.text,
            _expirationDateController.text,
            _secCodeController.text)
        .then((value) => Navigator.of(context).pop());
  }

  @override
  void dispose() {
    _emailController.dispose();
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

  Future<void> _showCreditCardDialog(var context) {
    return showDialog<bool>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                Text('Credit card number seems fishy, check it again please!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    _creditcardController.clear();
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        },
        context: context);
  }

  Future<void> _showCCVDialog(var context) {
    return showDialog<bool>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('CCV invalid, check it again please!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    _secCodeController.clear();
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        },
        context: context);
  }

  Future<void> _showExpDateDialog(var context) {
    return showDialog<bool>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('That isn\'t a valid expiration date!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    _expirationDateController.clear();
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        },
        context: context);
  }

  bool isFirstNameEmpty = false;
  bool isLastNameEmpty = false;
  bool isCreditCardEmpty = false;
  bool isSecCodeEmpty = false;
  bool isExpDateEmpty = false;

  @override
  Widget build(BuildContext context) {
    _emailController.text = widget.emailAddressInput;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                height: size.height * 1.05,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      top: size.height * 0.07,
                      child: Text(
                        'Edit your profile',
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
                      title: "Credit card",
                      topValue: 0.73,
                      controller: _creditcardController,
                      enabledField: true,
                      colorValue: isCreditCardEmpty ? Colors.red : customPurple,
                    ),
                    Positioned(
                      top: size.height * 0.85,
                      left: size.width * 0.12,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                        height: size.height * 0.06,
                        width: size.width * 0.26,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(
                              color:
                                  isExpDateEmpty ? Colors.red : customPurple),
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
                      top: size.height * (0.85 - 0.035),
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
                      top: size.height * 0.85,
                      left: size.width * 0.42,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                        height: size.height * 0.06,
                        width: size.width * 0.26,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(
                              color:
                                  isSecCodeEmpty ? Colors.red : customPurple),
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
                      top: size.height * (0.85 - 0.035),
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
                      top: size.height * 0.94,
                      child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: size.width * 0.07),
                          onPressed: () {
                            isFirstNameEmpty =
                                _firstNameController.text.isEmpty;
                            isLastNameEmpty = _lastNameController.text.isEmpty;
                            isCreditCardEmpty =
                                _creditcardController.text.isEmpty;
                            isExpDateEmpty =
                                _expirationDateController.text.isEmpty;

                            isSecCodeEmpty = _secCodeController.text.isEmpty;
                            if (isFirstNameEmpty ||
                                isCreditCardEmpty ||
                                isExpDateEmpty ||
                                isLastNameEmpty ||
                                isSecCodeEmpty) {
                              setState(() {});
                            } else if ((_creditcardController.text.length !=
                                    16 ||
                                _creditcardController.text
                                    .contains(new RegExp(r'([^0-9])')))) {
                              _showCreditCardDialog(context);
                            } else if (_secCodeController.text.length != 3 ||
                                _secCodeController.text
                                    .contains(new RegExp(r'([^0-9])'))) {
                              _showCCVDialog(context);
                            } else if (!_expirationDateController.text.contains(
                                new RegExp(r'^(0[1-9]|1[0-2])\/?(2[1-9])$'))) {
                              _showExpDateDialog(context);
                            } else if (_formKey.currentState.validate()) {
                              _register();
                            }
                          },
                          color: customPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Update profile",
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
            )));
  }
}
