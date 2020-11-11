/*import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> addLecturer(
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

Future<bool> addStudent(
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
*/
