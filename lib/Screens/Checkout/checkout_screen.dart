import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Checkout/componenets/body.dart';

class CheckoutScreen extends StatelessWidget {
  final course;
  CheckoutScreen(this.course);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckoutScreenStateful(this.course),
    );
  }
}

class CheckoutScreenStateful extends StatefulWidget {
  final course;
  CheckoutScreenStateful(this.course);
  @override
  _CheckoutScreen createState() => _CheckoutScreen();
}

class _CheckoutScreen extends State<CheckoutScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(widget.course),
    );
  }
}
