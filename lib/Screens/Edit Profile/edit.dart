import 'package:flutter/material.dart';
import 'components/bodyL.dart';
import 'components/bodyS.dart';

class EditStudentScreen extends StatelessWidget {
  final String emailAddressInput;

  EditStudentScreen(this.emailAddressInput);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditStudentStateful(emailAddressInput: this.emailAddressInput),
    );
  }
}

class EditStudentStateful extends StatefulWidget {
  final String emailAddressInput;

  EditStudentStateful({@required this.emailAddressInput});
  @override
  _EditStudentStateful createState() => _EditStudentStateful();
}

class _EditStudentStateful extends State<EditStudentStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyS(widget.emailAddressInput),
    );
  }
}

class EditLecturerScreen extends StatelessWidget {
  final String emailAddressInput;

  EditLecturerScreen(this.emailAddressInput);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditLecturerStateful(emailAddressInput: this.emailAddressInput),
    );
  }
}

class EditLecturerStateful extends StatefulWidget {
  final String emailAddressInput;

  EditLecturerStateful({@required this.emailAddressInput});
  @override
  _EditLecturerStateful createState() => _EditLecturerStateful();
}

class _EditLecturerStateful extends State<EditLecturerStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyL(widget.emailAddressInput),
    );
  }
}
