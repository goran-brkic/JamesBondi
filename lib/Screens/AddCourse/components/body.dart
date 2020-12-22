import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/uploadFile.dart';
import 'package:jamesbondi/constants.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

class Body extends StatefulWidget {
  String category;
  String difficulty;

  Body(this.category, this.difficulty);
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _shortDescriptionController =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  bool isCourseNameEmpty = false;
  String _path = '-';
  List<String> listaLinkova = new List<String>();
  List<String> listaImena = new List<String>();
  List<String> listaPuteva = new List<String>();
  int documentCount = 0;

  FlutterDocumentPickerParams params = FlutterDocumentPickerParams(
    allowedFileExtensions: ['pdf', 'mp4'],
    invalidFileNameSymbols: ['/'],
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: size.height * 1.34,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: size.height * 0.08,
                        child: Text(
                          'Create a course',
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
                        top: size.height * 0.13,
                        child: Image.asset(
                          'assets/images/Spacer_createAcc.png',
                          width: size.width * 0.7,
                        ),
                      ),
                      InputField(
                        title: 'Course name',
                        topValue: 0.25,
                        controller: _courseNameController,
                        enabledField: true,
                        colorValue:
                            isCourseNameEmpty ? Colors.red : customPurple,
                      ),
                      Positioned(
                        left: size.width * 0.12,
                        top: size.height * (0.39 - 0.035),
                        child: Text(
                          'Short description',
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.39,
                        left: size.width * 0.12,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                          height: size.height * 0.25,
                          width: size.width * 0.77,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F3F3),
                            borderRadius: BorderRadius.circular(29),
                            border: Border.all(color: customPurple),
                          ),
                          child: TextFormField(
                            controller: _shortDescriptionController,
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
                        top: size.height * (0.7 - 0.035),
                        child: Text(
                          'Price',
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Positioned(
                          top: size.height * 0.7,
                          left: size.width * 0.12,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 7),
                            height: size.height * 0.06,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F3F3),
                              borderRadius: BorderRadius.circular(29),
                              border: Border.all(color: customPurple),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          )),
                      Positioned(
                        left: size.width * 0.12,
                        top: size.height * (0.84 - 0.035),
                        child: Text(
                          "Learning materials",
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Positioned(
                          top: size.height * 0.84,
                          left: size.width * 0.12,
                          child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: size.width * 0.07),
                              onPressed: () async {
                                _path =
                                    await FlutterDocumentPicker.openDocument(
                                        params: params);

                                if (_path != "-") {
                                  print(_path.split(
                                      r'/')[_path.split(r'/').length - 1]);
                                  //listaLinkova
                                  //  .add(await uploadFile(File(_path)));
                                  listaPuteva.add(_path);
                                  listaImena.add(_path.split(
                                      r'/')[_path.split(r'/').length - 1]);
                                  setState(() {
                                    documentCount++;
                                  });
                                }
                              },
                              color: customPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "Upload",
                                style: TextStyle(
                                    fontFamily: 'RoundLight',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    color: Colors.white),
                              ))),
                      Positioned(
                        //popraviti kasnije
                        left: size.width * 0.43,
                        top: size.height * 0.855,
                        child: Image.asset(
                          'assets/images/Upload.png',
                          width: size.width * 0.1,
                          height: size.height * 0.04,
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.95,
                        child: Container(
                            width: size.width,
                            height: size.height / 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[150],
                              border: Border(
                                top:
                                    BorderSide(width: 1.0, color: customPurple),
                                bottom:
                                    BorderSide(width: 1.0, color: customPurple),
                              ),
                            ),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  for (var ime in listaImena)
                                    matButton(size, ime)
                                ],
                              ),
                            )),
                      ),
                      Positioned(
                        top: size.height * 1.23,
                        height: 50,
                        width: 300,
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: size.width * 0.07),
                            onPressed: () async {
                              List<String> linkovi;
                              for (var i in listaPuteva) {
                                linkovi.add(await uploadFile(File(i)));
                              }

                              await CoursesDB.addCourse(
                                  widget.category,
                                  widget.difficulty,
                                  _courseNameController.text,
                                  _shortDescriptionController.text,
                                  FirebaseAuth.instance.currentUser.email,
                                  double.parse(_priceController.text),
                                  linkovi);
                            },
                            color: customPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'Add course',
                              style: TextStyle(
                                  fontFamily: 'RoundLight',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ))));
  }
}

GestureDetector matButton(Size size, String ime) {
  return GestureDetector(
    onTap: () {
      //delete file ?
    },
    child: Container(
      padding: EdgeInsets.only(right: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[150],
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          border: Border(
            top: BorderSide(width: 1.0, color: customPurple),
            left: BorderSide(width: 1.0, color: customPurple),
            right: BorderSide(width: 1.0, color: customPurple),
            bottom: BorderSide(width: 1.0, color: customPurple),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              //ucitaj iz "bp"
              ime.split(".")[1] == "pdf"
                  ? "assets/images/pdf.png"
                  : "assets/images/mp4.png",
              height: size.height / 7,
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Text((ime.split(".")[0]),
                  style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.black)),
            ),
          ],
        ),
      ),
    ),
  );
}
