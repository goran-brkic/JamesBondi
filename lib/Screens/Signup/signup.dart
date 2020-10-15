import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
bool signed = false;

class RegisterEmailSection extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => RegisterEmailSectionState();
}

class RegisterEmailSectionState extends State<RegisterEmailSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  void _register() async {
    final User user = (await auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        signed = true;
        _success = true;
        _userEmail = user.email;
        user.sendEmailVerification();
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
