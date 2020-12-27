import 'package:flutter/material.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatefulWidget {
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  TextEditingController _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
      backgroundColor: customPurple,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //TO DO
            },
          ),
        ),
      ],
      title: Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 1, color: Colors.white, style: BorderStyle.solid)),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
                hintText: 'Search',
                contentPadding: EdgeInsets.fromLTRB(15, 4, 15, 15),
                border: InputBorder.none),
            onChanged: (value) {},
          ),
        ),
      ),
      /*body: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) => ListTile(
                  title: Text(
                widget.list[index],
              ))),*/
    ));
  }
}
