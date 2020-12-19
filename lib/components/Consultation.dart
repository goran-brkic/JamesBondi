import 'package:cloud_firestore/cloud_firestore.dart';

class ConsultationDB {
  static Future<bool> createConsRequest(
      final String courseID,
      final String studentMail,
      final String lecturerMail,
      final DateTime reqDate,
      final bool studentConfirm,
      final bool lecturerConfirm) {
    return FirebaseFirestore.instance
        .collection('meetings')
        .add({
          'courseID': courseID,
          'studentMail': studentMail,
          'lecturerMail': lecturerMail,
          'reqDate': reqDate,
          'studentConfirm': studentConfirm,
          'lecturerConfirm': lecturerConfirm
        })
        .then((value) => true)
        .catchError((error) => print('Failed to add course: $error'));
  }

  static Future<List> getConsultations(final String mail, final bool student) {
    List returnList;
    return FirebaseFirestore.instance
        .collection('meetings')
        .where(student ? 'studentMail' : 'lecturerMail', isEqualTo: mail)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                Map<String, dynamic> temp;
                temp = doc.data();
                temp['meetID'] = doc.id;
                // print('DOCUMENT ID:' + doc.id);
                returnList.add(temp);
              })
            })
        .then((value) => returnList)
        .catchError((error) => print('Failed to add course: $error'));
  }

  static Future<Map<String, dynamic>> getConsultation(final String meetID) {
    Map<String, dynamic> returnItem;
    return FirebaseFirestore.instance
        .collection('meetings')
        .doc(meetID)
        .get()
        .then((DocumentSnapshot docSnapshot) {
      returnItem = docSnapshot.data();
    }).then((value) => returnItem);
  }
}
