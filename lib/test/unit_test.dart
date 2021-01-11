import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class FakeAuthCredential extends Mock implements AuthCredential {}

void main() {
  Future<void> addCourse(MockFirestoreInstance firestore, String courseName) {
    return firestore
        .collection('courses')
        .add({
          'courseName': courseName,
        })
        .then((result) => 'Added')
        .catchError((result) => 'Failed');
  }

  Future<bool> checkEmailAddress(
      MockFirestoreInstance firestore, final String email) {
    var available = true;
    return firestore
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

  Future<void> addUser(
      MockFirestoreInstance firestore, final String mail) async {
    if (await checkEmailAddress(firestore, mail) == false)
      return Future.value();
    return firestore
        .collection('users')
        .add({
          'mail': mail,
        })
        .then((value) => true)
        .catchError((error) => print('Failed to add user: $error'));
  }

  test('Add course', () async {
    final firestoreMock = MockFirestoreInstance();
    await addCourse(firestoreMock, 'Test 1');
    await addCourse(firestoreMock, 'Test 2');
    await addCourse(firestoreMock, 'Test 3');
    final snapshot = await firestoreMock.collection('courses').get();
    expect(snapshot.docs.length, 3);
  });

  test('Add unique user to database', () async {
    final firestoreMock = MockFirestoreInstance();
    await addUser(firestoreMock, 'test@mail.com');
    await addUser(firestoreMock, 'test1@mail.com');
    final snapshot = await firestoreMock.collection('users').get();
    expect(snapshot.docs.length, 2);

    await addUser(firestoreMock, 'test@mail.com');
    final snapshotNew = await firestoreMock.collection('users').get();
    expect(snapshotNew.docs.length, 2);
  });

  test('No user signed in', () async {
    final auth = MockFirebaseAuth();
    final user = auth.currentUser;
    expect(user, isNull);
  });

  test('Credential login', () async {
    final auth = MockFirebaseAuth();
    final result = await auth.signInWithEmailAndPassword(
        email: 'test@mail.com', password: 'password');
    final user = result.user;

    expect(user.uid, isNotEmpty);
    expect(user.displayName, isNotEmpty);
    expect(auth.authStateChanges(), emitsInOrder([isA<User>()]));
    expect(user.isAnonymous, isFalse);
  });

  test('Returns user if already signed in', () async {
    var auth = MockFirebaseAuth(signedIn: true);

    final user = auth.currentUser;
    expect(user.uid, isNotEmpty);
    expect(user.displayName, isNotEmpty);
  });

  test('Returns null after sign out', () async {
    var auth = MockFirebaseAuth(signedIn: true);

    final user = auth.currentUser;

    await auth.signOut();

    expect(auth.currentUser, isNull);
    expect(auth.authStateChanges(), emitsInOrder([user, null]));
  });
}
