import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoDB {
  static Future<bool> addLecturer(
      final String username,
      final String mail,
      final String firstName,
      final String lastName,
      final String iban,
      final String aboutY,
      final String image) {
    return FirebaseFirestore.instance
        .collection('users')
        .add({
          'username': username,
          'mail': mail,
          'firstName': firstName,
          'lastName': lastName,
          'iban': iban,
          'creditCard': null,
          'cardExp': null,
          'secCode': null,
          'lecturer': true,
          'about': aboutY,
          'image': image
        })
        .then((value) => true)
        .catchError((error) => print('Failed to add user: $error'));
  }

  static Future<bool> addStudent(
      final String username,
      final String mail,
      final String firstName,
      final String lastName,
      final String creditCard,
      final String cardExp,
      final String secCode) {
    return FirebaseFirestore.instance
        .collection('users')
        .add({
          'username': username,
          'mail': mail,
          'firstName': firstName,
          'lastName': lastName,
          'creditCard': creditCard,
          'cardExp': cardExp,
          'secCode': secCode,
          'iban': null,
          'lecturer': false,
          'about': null,
          'image': null
        })
        .then((value) => true)
        .catchError((error) => print('Failed to add user: $error'));
  }

  static Future<bool> checkEmailAddress(String email) {
    var available = true;
    return FirebaseFirestore.instance
        .collection('users')
        .where('mail', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                available = false;
              })
            })
        .then((value) => available);
  }

  static Future<bool> checkUser(String username) {
    var used = true;
    return FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                used = false;
              })
            })
        .then((value) => used);
  }

  static Future<Map<String, dynamic>> getUserInfo(String inputMail) {
    var returnList = Map<String, dynamic>();
    return FirebaseFirestore.instance
        .collection('users')
        .where('mail', isEqualTo: inputMail)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                //print(doc['mail']);
                returnList['firstName'] = doc['firstName'];
                returnList['iban'] = doc['iban'];
                returnList['lastName'] = doc['lastName'];
                returnList['lecturer'] = doc['lecturer'];
                returnList['creditCard'] = doc['creditCard'];
                returnList['cardExp'] = doc['cardExp'];
                returnList['lecturer'] = doc['lecturer'];
                returnList['secCode'] = doc['secCode'];
                returnList['username'] = doc['username'];
                returnList['image'] = doc['image'];
                returnList['about'] = doc['about'];
                returnList['courses'] = doc['courses'];
                //print('PRINTAM ' + returnList['firstName']);
                //returnList = new Map<String, dynamic>.from(doc.data());
              })
            })
        .then((value) => returnList);
    //return returnList;
  }

  static Future<String> getTypeOfUser(String inputMail) {
    String lecturer;
    return FirebaseFirestore.instance
        .collection('users')
        .where('mail', isEqualTo: inputMail)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                lecturer = doc['lecturer'].toString();

                //print('PRINTAM ' + returnList['firstName']);
                //returnList = new Map<String, dynamic>.from(doc.data());
              })
            })
        .then((value) => lecturer);
    //return returnList;
  }

  static Future<void> addCourse(String mail, String courseID) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('mail', isEqualTo: mail)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                doc.reference.update({
                  'courses': FieldValue.arrayUnion([courseID])
                });
              })
            });
  }

  static Future<bool> searchCourse(String mail, String courseID) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('mail', isEqualTo: mail)
        .where('courses', arrayContains: courseID)
        .get()
        .then((QuerySnapshot querySnapshot) =>
            querySnapshot.size > 0 ? true : false)
        .catchError((value) => false);
  }

  static Future<List> getCourses(String mail) {
    var retList;
    return FirebaseFirestore.instance
        .collection('users')
        .where('mail', isEqualTo: mail)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                retList = doc.data()['courses'];
              })
            })
        .then((value) => retList);
  }

  static Future<bool> updateStudent(
      final String mail,
      final String firstName,
      final String lastName,
      final String creditCard,
      final String cardExp,
      final String secCode) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('mail', isEqualTo: mail)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                doc.reference.update({
                  'firstName': firstName,
                  'lastName': lastName,
                  'creditCard': creditCard,
                  'cardExp': cardExp,
                  'secCode': secCode
                });
              })
            })
        .then((value) => true)
        .catchError((error) => print('Failed to add user: $error'));
  }

  static Future<bool> updateLecturer(
      final String mail,
      final String firstName,
      final String lastName,
      final String iban,
      final String aboutY,
      final String image) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('mail', isEqualTo: mail)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                doc.reference.update({
                  'firstName': firstName,
                  'lastName': lastName,
                  'iban': iban,
                  'about': aboutY,
                  'image': image
                });
              })
            })
        .then((value) => true)
        .catchError((error) => print('Failed to add user: $error'));
  }
}
