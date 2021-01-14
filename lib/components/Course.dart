import 'package:cloud_firestore/cloud_firestore.dart';

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
    List returnList;
    return FirebaseFirestore.instance
        .collection('courses/' + category + '/' + difficulty)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                returnList.add(doc);
              })
            })
        .then((value) => returnList);
  }

  static Future<Map<String, dynamic>> getCourse(
      final String category, final String difficulty, final String courseName) {
    Map<String, dynamic> returnItem;
    return FirebaseFirestore.instance
        .collection('courses/' + category + '/' + difficulty)
        .where('courseName', isEqualTo: courseName)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                returnItem = doc.data();
              })
            })
        .then((value) => returnItem);
  }
}
