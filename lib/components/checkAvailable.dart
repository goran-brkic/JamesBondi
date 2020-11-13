/*import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkEmailAddress(String email) {
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

Future<bool> checkUser(String username) {
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

/*

Future<bool> checkAvailable(String checkUsername, String checkEmail) async {
  if (!(await checkEmailAddress(checkEmail))) return false;
  if (!(await checkUser(checkUsername)))
    return false;
  else
    return true;
}

//bool available = true;

FirebaseFirestore.instance
      .collection('users')
      .where('username', isEqualTo: checkUsername)
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              available = false;
            })
          });

//if (!available) return false;
//print('AVAILABLE JE ' + (available ? 'true' : 'false'));


  FirebaseFirestore.instance
      .collection('users')
      .where('mail', isEqualTo: checkEmail)
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              available = false;
            })
          });
*/*/
