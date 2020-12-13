import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Categories Page/components/body.dart';

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
      body: Body(),
    );
  }
}
