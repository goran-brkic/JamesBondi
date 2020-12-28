import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Course%20Page/CourseScreen.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatefulWidget {
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  TextEditingController _textController = new TextEditingController();
  List<Map<String, dynamic>> courses = [];
  bool ready = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customPurple,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                courses = await CoursesDB.searchCourses(_textController.text)
                    .whenComplete(() => ready = true);
              },
            ),
          ),
        ],
        title: Container(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 1, color: Colors.white, style: BorderStyle.solid)),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding: EdgeInsets.fromLTRB(15, 4, 15, 15),
                  border: InputBorder.none),
              onChanged: (value) {},
            ),
          ),
        ),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) => button(
                  courses.elementAt(index)['category'],
                  courses.elementAt(index)['difficulty'],
                  courses.elementAt(index)))),
    );
  }

  Padding button(String cat, String dif, var course) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: FlatButton(
          color: customPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    CourseScreen(cat, dif, course['courseID'])));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                course['courseName'],
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white),
              ),
              Text(
                course['coursePrice'].toString() + ' HRk',
                style: TextStyle(
                    fontFamily: 'RoundLight',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}
