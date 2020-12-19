import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Checkout/componenets/body.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckoutScreenStateful(),
    );
  }
}

class CheckoutScreenStateful extends StatefulWidget {
  @override
  _CheckoutScreen createState() => _CheckoutScreen();
}

class _CheckoutScreen extends State<CheckoutScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
