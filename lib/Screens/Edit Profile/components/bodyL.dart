import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/userInfo.dart';
import 'package:jamesbondi/constants.dart';
import 'package:image_picker/image_picker.dart';
import '../../../components/uploadFile.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
bool signed = false;
RegExp expDateRegex = RegExp(r'^[0,1]?\d{1}\/(([0-2]?\d{1}/))');

enum Person { lecturer, student }

class BodyL extends StatefulWidget {
  final String emailAddressInput;

  BodyL(this.emailAddressInput);

  @override
  _Body createState() => _Body();
}

class _Body extends State<BodyL> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ibanController = TextEditingController();
  final TextEditingController _aboutYController = TextEditingController();
  String imageURL;

  void _register() async {
    UserInfoDB.updateLecturer(
            widget.emailAddressInput,
            _firstNameController.text,
            _lastNameController.text,
            _ibanController.text,
            _aboutYController.text,
            imageURL)
        .then((value) => Navigator.of(context).pop());
  }

  Future<void> getUser(String mail) async {
    var map = await UserInfoDB.getUserInfo(mail);
    _firstNameController.text = map['firstName'];
    _lastNameController.text = map['lastName'];
    _ibanController.text = map['iban'];
    _aboutYController.text = map['about'];
    imageURL = map['image'];
  }

  @override
  initState() {
    getUser(widget.emailAddressInput);
    super.initState();
  }

  File _image;
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

  Future<void> _showIBANDialog(var context) {
    return showDialog<bool>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('You seem to be a few numbers off your IBAN!'),
            actions: [
              FlatButton(
                  onPressed: () {
                    _ibanController.clear();
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
  bool isIbanEmpty = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        key: Key('edit-scroll'),
        child: Container(
          height: size.height * 1.145,
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
              Container(
                child: new Stack(
                  children: <Widget>[
                    Positioned(
                      top: size.height * 0.2,
                      left: size.width * 0.12,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        height: size.height * 0.06,
                        width: size.width * 0.77,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(
                              color:
                                  isFirstNameEmpty ? Colors.red : customPurple),
                        ),
                        child: TextFormField(
                          key: Key('first-name'),
                          enabled: true,
                          controller: _firstNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.12,
                      top: size.height * (0.2 - 0.035),
                      child: Text(
                        'First name',
                        style: TextStyle(
                          fontFamily: 'RoundLight',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: new Stack(
                  children: <Widget>[
                    Positioned(
                      top: size.height * 0.32,
                      left: size.width * 0.12,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        height: size.height * 0.06,
                        width: size.width * 0.77,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(
                              color:
                                  isLastNameEmpty ? Colors.red : customPurple),
                        ),
                        child: TextFormField(
                          key: Key('last-name'),
                          enabled: true,
                          controller: _lastNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.12,
                      top: size.height * (0.32 - 0.035),
                      child: Text(
                        "Last name",
                        style: TextStyle(
                          fontFamily: 'RoundLight',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InputField(
                title: "IBAN",
                topValue: 0.44,
                controller: _ibanController,
                enabledField: true,
                colorValue: isIbanEmpty ? Colors.red : customPurple,
              ),
              Positioned(
                left: size.width * 0.12,
                top: size.height * (0.56 - 0.035),
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
                top: size.height * 0.56,
                left: size.height * 0.07,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: customPurple),
                      borderRadius: BorderRadius.circular(100)),
                  child: RawMaterialButton(
                    onPressed: () async {
                      await getImage();
                      imageURL = await uploadImage(_image);
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
                                child: Image.file(File(imageURL))))
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
                top: size.height * 0.75,
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
                    key: Key('about-input'),
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
                top: size.height * (0.75 - 0.035),
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
                top: size.height * 1.03,
                child: FlatButton(
                    key: Key('update-button'),
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: size.width * 0.07),
                    onPressed: () {
                      isFirstNameEmpty = _firstNameController.text.isEmpty;
                      isLastNameEmpty = _lastNameController.text.isEmpty;
                      isIbanEmpty = _ibanController.text.isEmpty;

                      if (isFirstNameEmpty || isIbanEmpty || isLastNameEmpty) {
                        setState(() {});
                      } else if (_ibanController.text.length != 21 ||
                          _ibanController.text.contains(r'([^0-9])')) {
                        _showIBANDialog(context);
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
      ),
    ));
  }
}
