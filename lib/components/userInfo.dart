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
    bool available = true;
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
    bool used = true;
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
    Map<String, dynamic> returnList = new Map();
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
}
