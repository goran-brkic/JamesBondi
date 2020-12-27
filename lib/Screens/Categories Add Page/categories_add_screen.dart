import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Categories Add Page/components/body.dart';

class CategoriesAddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoriesScreenAddStateful(),
    );
  }
}

class CategoriesScreenAddStateful extends StatefulWidget {
  @override
  _CategoriesAddScreen createState() => _CategoriesAddScreen();
}

class _CategoriesAddScreen extends State<CategoriesScreenAddStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
