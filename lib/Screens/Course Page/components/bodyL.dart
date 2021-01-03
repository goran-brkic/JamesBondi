import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/components/Result.dart';
import 'package:jamesbondi/components/uploadFile.dart';
import 'package:jamesbondi/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyLec extends StatefulWidget {
  final String id;
  final String cat;
  final String dif;
  BodyLec(this.cat, this.dif, this.id);
  @override
  _BodyLec createState() => _BodyLec(this.cat, this.dif, this.id);
}

class _BodyLec extends State<BodyLec> {
  String courseID;
  String courseCat;
  String courseDif;
  _BodyLec(String cat, String dif, String id) {
    courseCat = cat;
    courseDif = dif;
    courseID = id;
  }
  Future<void> _showConfirmDialog(var context) async {
    return showDialog<bool>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Would you like to apply these changes?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      listaImena.clear();
                      listaLinkova.clear();
                      listaPuteva.clear();
                      _deleteList.clear();
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
              FlatButton(
                  onPressed: () async {
                    await CoursesDB.removeMaterials(
                        courseCat, courseDif, courseID, _deleteList);
                    List<String> linkovi = [];
                    for (var i in listaPuteva) {
                      linkovi.add(await uploadFile(File(i)));
                    }
                    await CoursesDB.addMaterials(
                        courseCat, courseDif, courseID, linkovi);
                    setState(() {
                      listaImena.clear();
                      listaLinkova.clear();
                      listaPuteva.clear();
                      _deleteList.clear();
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes'))
            ],
          );
        },
        context: context);
  }

  Future<void> _showEraseDialog(var context, var materialLink) async {
    return showDialog<bool>(
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Would you like to delete this material?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
              FlatButton(
                  onPressed: () {
                    _deleteList.add(materialLink);
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes'))
            ],
          );
        },
        context: context);
  }

  String _path = '-';
  List<String> listaLinkova = new List<String>();
  List<String> listaImena = new List<String>();
  List<String> listaPuteva = new List<String>();
  int documentCount = 0;

  FlutterDocumentPickerParams params = FlutterDocumentPickerParams(
    allowedFileExtensions: ['pdf', 'mp4'],
    invalidFileNameSymbols: ['/'],
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool edit = false;
  List<String> _deleteList = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: CoursesDB.getCourse(courseCat, courseDif, courseID),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          Widget children;
          if (!snapshot.hasData)
            children = loadingBar();
          else if (snapshot.hasData) {
            children = SingleChildScrollView(
                child: Form(
              key: _formKey,
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
                      top: size.height * 0.15,
                      child: Image.asset(
                        'assets/images/Line 1.png',
                        width: size.width * 0.7,
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      child: Text(
                        snapshot.hasData
                            ? snapshot.data['courseName']
                            : 'LOADING',
                        style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 34,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.165,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  LProfileScreen(snapshot.data['courseMail'])));
                        },
                        child: Text(
                          snapshot.hasData
                              ? snapshot.data['courseMail']
                              : 'LOADING',
                          style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.normal,
                              fontSize: 26,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.27,
                      child: Container(
                        width: size.width - 10,
                        height: size.height / 4,
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
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        child: Text(
                            snapshot.hasData ? snapshot.data['courseInfo'] : '',
                            style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.55,
                      child: Container(
                        width: size.width - 10,
                        height: size.height / 4,
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Materials',
                            style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: customPurple,
                            )),
                      ),
                    ),
                    edit
                        ? Positioned(
                            top: size.height * 0.545,
                            left: size.height * 0.22,
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: GestureDetector(
                                onTap: () async {
                                  _path =
                                      await FlutterDocumentPicker.openDocument(
                                          params: params);

                                  if (_path != "-") {
                                    print(_path.split(
                                        r'/')[_path.split(r'/').length - 1]);

                                    listaPuteva.add(_path);
                                    listaImena.add(_path.split(
                                        r'/')[_path.split(r'/').length - 1]);
                                    setState(() {
                                      documentCount++;
                                    });
                                  }
                                },
                                child: Image.asset(
                                  'assets/images/Upload.png',
                                  width: size.width * 0.05,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                          )
                        : Container(),

                    Positioned(
                      top: size.height * 0.6,
                      child: Container(
                          width: size.width,
                          height: size.height / 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[150],
                            border: Border(
                              top: BorderSide(width: 1.0, color: customPurple),
                              bottom:
                                  BorderSide(width: 1.0, color: customPurple),
                            ),
                          ),
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                for (var mat
                                    in snapshot.data['courseMaterials'])
                                  _deleteList.contains(mat)
                                      ? Container()
                                      : matButton(size, mat),
                                for (var ime in listaImena)
                                  newMatButton(size, ime)
                              ],
                            ),
                          )),
                    ),

                    Positioned(
                      top: size.height * 0.88,
                      height: 50,
                      width: 300,
                      child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: size.width * 0.07),
                          onPressed: () async {
                            if (edit) {
                              await _showConfirmDialog(context);
                            }

                            setState(() {
                              edit = !edit;
                            });
                          },
                          color: customPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            !edit ? 'Edit course' : 'Finish editing',
                            style: TextStyle(
                                fontFamily: 'RoundLight',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )),
                    ),
                    //zavrsava dio gdje je korisnik ulogiran
                  ],
                ),
              ),
            ));
          } else {
            children = Column(children: <Widget>[
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
          return children;
        });
  }

  Widget matButton(var size, var materialLink) {
    int endLocation = RegExp(r"materials%(\S)*%").firstMatch(materialLink).end;
    int startLocation =
        RegExp(r"materials%(\S)*%").firstMatch(materialLink).start;
    //print(materialLink.substring(endLocation - 4, endLocation - 1));
    return GestureDetector(
      onTap: () async {
        if (edit) {
          await _showEraseDialog(context, materialLink);
        } else
          launch(materialLink);
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
                materialLink.substring(endLocation - 4, endLocation - 1) ==
                        'pdf'
                    ? 'assets/images/pdf.png'
                    : 'assets/images/mp4.png',
                height: size.height / 7,
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                    //ime iz baze, mozemo ogranicit na nekolko charova ?
                    materialLink.substring(startLocation + 12, endLocation - 5),
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

  GestureDetector newMatButton(Size size, String ime) {
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
}
