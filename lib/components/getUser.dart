/*import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>> getUserInfo(String inputMail) {
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

Future<String> getTypeOfUser(String inputMail) {
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
*/
