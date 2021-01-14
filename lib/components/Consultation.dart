import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<List> getConsultations(final String mail) async {
    List returnList = new List();
    var type = await SharedPreferences.getInstance()
        .then((value) => value.getBool('lecturer'));
    return FirebaseFirestore.instance
        .collection('meetings')
        .where(!type ? 'studentMail' : 'lecturerMail', isEqualTo: mail)
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
        .catchError((error) => print('Failed to get consultations: $error'));
  }

  static Future<void> confirmConsultationsLecturer(String meetID) {
    return FirebaseFirestore.instance
        .collection('meetings')
        .doc(meetID)
        .update({'lecturerConfirm': true});
  }

  static Future<void> confirmConsultationsStudent(String meetID) {
    return FirebaseFirestore.instance
        .collection('meetings')
        .doc(meetID)
        .update({'studentConfirm': true});
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

  static Future<void> updateConsultation(
      String meetID, DateTime reqDate, bool lec) {
    print('TRAZIM DOKUMENT S ID: ' + meetID.toString());
    return FirebaseFirestore.instance.collection('meetings').doc(meetID).update(
        {'studentConfirm': !lec, 'lecturerConfirm': lec, 'reqDate': reqDate});
  }

  static Future<List> getSchConsultations(final String mail, bool lec) async {
    List returnList = new List();
    return FirebaseFirestore.instance
        .collection('meetings')
        .where(!lec ? 'studentMail' : 'lecturerMail', isEqualTo: mail)
        .where('lecturerConfirm', isEqualTo: true)
        .where('studentConfirm', isEqualTo: true)
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
        .catchError((error) => print('Failed to get consultations: $error'));
  }

  static Future<List> getUnappConsultations(final String mail, bool lec) async {
    List returnList = new List();
    return FirebaseFirestore.instance
        .collection('meetings')
        .where(!lec ? 'studentMail' : 'lecturerMail', isEqualTo: mail)
        .where('lecturerConfirm', isEqualTo: lec)
        .where('studentConfirm', isEqualTo: !lec)
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
        .catchError((error) => print('Failed to get consultations: $error'));
  }

  static Future<List> getPendConsultations(final String mail, bool lec) async {
    List returnList = new List();
    return FirebaseFirestore.instance
        .collection('meetings')
        .where(!lec ? 'studentMail' : 'lecturerMail', isEqualTo: mail)
        .where('lecturerConfirm', isEqualTo: !lec)
        .where('studentConfirm', isEqualTo: lec)
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
        .catchError((error) => print('Failed to get consultations: $error'));
  }
}
