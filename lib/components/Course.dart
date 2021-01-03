import 'package:cloud_firestore/cloud_firestore.dart';

class CoursesDB {
  static Future<bool> addCourse(
      final String category,
      final String difficulty,
      final String courseName,
      final String courseInfo,
      final String mail,
      final double price,
      final List<String> materials) {
    List<String> keywords = [];
    for (var i in courseName.split(' ')) {
      keywords.add(i.toLowerCase());
    }
    return FirebaseFirestore.instance
        .collection('courses/' + category + '/' + difficulty)
        .add({
          'courseName': courseName,
          'courseInfo': courseInfo,
          'courseMail': mail,
          'coursePrice': price,
          'courseMaterials': materials,
          'keywords': keywords
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
                // print('DOCUMENT ID:' + doc.id);
                returnList.add(temp);
              })
            })
        .then((value) => returnList);
  }

  static Future<String> getCourseName(final String courseID) {
    String returnItem;
    return FirebaseFirestore.instance
        .collection('courses')
        .doc(courseID)
        .get()
        .then((DocumentSnapshot docSnapshot) {
      returnItem = docSnapshot.id;
    }).then((value) => returnItem);
  }

  static Future<Map<String, dynamic>> getCourse(
      final String category, final String difficulty, final String courseID) {
    Map<String, dynamic> returnItem;
    return FirebaseFirestore.instance
        .collection('courses/' + category + '/' + difficulty)
        .doc(courseID)
        .get()
        .then((DocumentSnapshot docSnapshot) {
      returnItem = docSnapshot.data();
      returnItem['courseID'] = docSnapshot.id;
    }).then((value) => returnItem);
  }

  static Future<List<Map<String, dynamic>>> searchCourses(
      final String keyword) async {
    var cats = ['IT', 'cooking', 'garden', 'makeup', 'random'];
    var difs = ['advanced', 'beginner', 'intermediate'];
    List<Map<String, dynamic>> returnItem = [];
    //print('Trazim tecaj se keyword: ' + keyword);
    for (var i in cats) {
      for (var j in difs) {
        await FirebaseFirestore.instance
            .collection('courses/' + i + '/' + j)
            .where('keywords', arrayContains: keyword.toLowerCase())
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((doc) {
                    //print('Nasao sam course: ' + doc.data().toString());
                    Map<String, dynamic> temp;
                    temp = doc.data();
                    temp['courseID'] = doc.id;
                    temp['category'] = i;
                    temp['difficulty'] = j;
                    returnItem.add(temp);
                  })
                });
      }
    }
    //print('Returnam: ' + returnItem.toString());
    return Future.value(returnItem);
  }

  static Future<void> removeMaterials(final String category,
      final String difficulty, final String courseID, List mats) {
    print('BRISEM MATERIJALE');
    return FirebaseFirestore.instance
        .collection('courses/' + category + '/' + difficulty)
        .doc(courseID)
        .update({'courseMaterials': FieldValue.arrayRemove(mats)});
  }

  static Future<void> addMaterials(final String category,
      final String difficulty, final String courseID, List mats) {
    print('DODAJEM MATERIALE');
    return FirebaseFirestore.instance
        .collection('courses/' + category + '/' + difficulty)
        .doc(courseID)
        .update({'courseMaterials': FieldValue.arrayUnion(mats)});
  }
}
