import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:path/path.dart' as Path;

Future<String> uploadFile(File image) async {
  Reference storageReference = FirebaseStorage.instance
      .ref()
      .child('materials/${Path.basename(image.path)}}');
  UploadTask uploadTask = storageReference.putFile(image);
  await uploadTask.whenComplete(() => null);
  print('File Uploaded');
  return storageReference.getDownloadURL();
}

Future<String> uploadImage(File image) async {
  Reference storageReference = FirebaseStorage.instance
      .ref()
      .child('pictures/${Path.basename(image.path)}}');
  UploadTask uploadTask = storageReference.putFile(image);
  await uploadTask.whenComplete(() => null);
  print('File Uploaded');
  return storageReference.getDownloadURL();
}
