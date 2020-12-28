import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Categories Page/components/body.dart';
import 'package:jamesbondi/Screens/Categories%20Page/components/bodyS.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoriesScreenStateful(),
    );
  }
}

class CategoriesScreenStateful extends StatefulWidget {
  @override
  _CategoriesScreen createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: SharedPreferences.getInstance()
              .then((value) => value.getBool('lecturer')),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('Please wait its loading...'));
            } else {
              if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));
              else {
                if (!snapshot.hasData)
                  return Center(child: Text('No Data'));
                else {
                  return snapshot.data ? BodyLec() : BodyS();
                }
              }
            }
          }),
    );
  }
}
