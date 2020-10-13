import 'package:cloud_firestore/cloud_firestore.dart';

void addLecturer(final String username, final String mail, final DateTime dob,
    final String firstName, final String lastName, final String iban) {
  FirebaseFirestore.instance
      .collection('users')
      .add({
        'username': username,
        'mail': mail,
        'dob': dob,
        'firstName': firstName,
        'lastName': lastName,
        'iban': iban,
        'lecturer': true
      })
      .then((value) => print('User (lecturer) Added'))
      .catchError((error) => print('Failed to add user: $error'));
}

void addStudent(
    final String username,
    final String mail,
    final DateTime dob,
    final String firstName,
    final String lastName,
    final String creditCard,
    final DateTime cardExp,
    final int secCode) {
  FirebaseFirestore.instance
      .collection('users')
      .add({
        'username': username,
        'mail': mail,
        'dob': dob,
        'firstName': firstName,
        'lastName': lastName,
        'creditCard': creditCard,
        'cardExp': cardExp,
        'secCode': secCode,
        'lecturer': false
      })
      .then((value) => print('User (student) Added'))
      .catchError((error) => print('Failed to add user: $error'));
}

Future<Map<String, dynamic>> getUserInfo(String inputUsername) async {
  Map<String, dynamic> returnList = new Map();
  return FirebaseFirestore.instance
      .collection('users')
      .where('username', isEqualTo: inputUsername)
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              print(doc['mail']);
              returnList['dob'] = doc['dob'];
              returnList['firstName'] = doc['firstName'];
              returnList['iban'] = doc['iban'];
              returnList['lastName'] = doc['lastName'];
              returnList['lecturer'] = doc['lecturer'];
              returnList['mail'] = doc['mail'];
              returnList['username'] = doc['username'];
              print('PRINTAM ' + returnList['firstName']);
              //returnList = new Map<String, dynamic>.from(doc.data());
            })
          })
      .then((value) => returnList);
  //return returnList;
}
