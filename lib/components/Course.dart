import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';

class CoursesDB {
  static Future<bool> addCourse(
      final String category,
      final String difficulty,
      final String courseName,
      final String mail,
      final double price,
      final List<String> materials) {
    return FirebaseFirestore.instance
        .collection('courses/' + category + '/' + difficulty)
        .add({
          'courseName': courseName,
          'courseMail': mail,
          'coursePrice': price,
          'courseMaterials': materials
        })
        .then((value) => true)
        .catchError((error) => print('Failed to add course: $error'));
  }

  static Future<List> getCourses(
      final String category, final String difficulty) {
    List returnList = new List();
    return FirebaseFirestore.instance
        .collection('courses/' + category + '/' + difficulty)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> temp;
                temp = doc.data();
                temp['courseID'] = doc.id;
                print("DOCUMENT ID:" + doc.id);
                returnList.add(temp);
              })
            })
        .then((value) => returnList);
  }

  static Future<Map<String, dynamic>> getCourse(
      final String category, final String difficulty, final String courseID) {
    Map<String, dynamic> returnItem;
    print("Trazim kat: " +
        category +
        "  i dif: " +
        difficulty +
        " i ID: " +
        courseID);
    return FirebaseFirestore.instance
        .collection('courses/' + category + '/' + difficulty)
        .doc(courseID)
        .get()
        .then((DocumentSnapshot docSnapshot) {
      returnItem = docSnapshot.data();
      //print("DOHVACAM COURSE S ID: " + courseID);

      /*
      if (docSnapshot.exists) {
        print('Document data: ${docSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
      */
    }).then((value) => returnItem);
  }
}
