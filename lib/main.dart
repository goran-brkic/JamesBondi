import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'signup.dart';
import 'signin.dart';

void main() {
  runApp(App());
}

//Test branch
//Dodik commit :(

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      //return SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      //return Loading();
    }

    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
        title: 'Main',
        home: Scaffold(
            body: Container(
          /*
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 10.0, color: Color(0xFFFFFFFFFF)),
              left: BorderSide(width: 5.0, color: Color(0xFFFFFFFFFF)),
              right: BorderSide(width: 5.0, color: Color(0xFFFF000000)),
              bottom: BorderSide(width: 10.0, color: Color(0xFFFF000000)),
            ),
          ),
          */
          color: Color(0xEEEEEE),
          padding: const EdgeInsets.only(
            left: 10.0,
            top: 300.0,
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  //color: Colors.blueGrey[100],
                  child: Container(
                    child: Text("Mail"),
                  ),
                ),
              ),

              Container(
                width: 250.0,
                height: 30.0,
                child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xF3F3F3),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.purple[800]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.purple[800]),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 5, color: Colors.red)),
                      hintText: "mail",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                      //errorText: 'username is already taken',
                    ),
                    textAlignVertical: TextAlignVertical.bottom,
                    textAlign: TextAlign.left),
              ),

              //drugi dio
              Center(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                  ),
                  //color: Colors.blueGrey[1000],
                  child: Container(
                    child: Text("Username"),
                  ),
                ),
              ),
              Container(
                width: 250.0,
                height: 30.0,
                child: new TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xF3F3F3),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.purple[800]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.purple[800]),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 5, color: Colors.red)),
                      hintText: "username",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                      //errorText: 'username is already taken',
                    ),
                    textAlignVertical: TextAlignVertical.bottom,
                    textAlign: TextAlign.left),
              ),

              //treci dio
              Center(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                  ),
                  //color: Colors.blueGrey[1000],
                  child: Container(
                    child: Text("Password"),
                  ),
                ),
              ),

              Container(
                width: 250.0,
                height: 30.0,
                child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xF3F3F3),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.purple[800]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(width: 1, color: Colors.purple[800]),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 5, color: Colors.red)),
                      hintText: "password",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                      //errorText: 'username is already taken',
                    ),
                    textAlignVertical: TextAlignVertical.bottom,
                    textAlign: TextAlign.left),
              ),

              Container(
                  width: 200.0,
                  height: 100.0,
                  padding: const EdgeInsets.only(
                    top: 50.0,
                  ),
                  child: new OutlineButton(
                      //
                      //treba "zaokruzit" button
                      //
                      /*
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                      ),
                      */
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                          width: 200.0,
                          height: 50.0,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF8E24AA),
                                Color(0xFFAB47BC),
                                Color(0xFFBA68C8),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: const Text(
                              'Sign up',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ))))
            ],
          ),
        )));

    return materialApp;
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.purple[800],
      width: 5.0,
    ),
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void signOutButton() async {
    final User user = auth.currentUser;
    if (user == null) {
      signed = false;
      return;
    }
    await auth.signOut();
    final String uid = user.uid;
    signed = false;
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(uid + ' has successfully signed out.'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(builder: (BuildContext context) {
        return ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'You are signed ',
                ),
                Text(
                  signed ? "IN" : "OUT",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(
                  height: 300,
                  child: RegisterEmailSection(),
                ),
                Container(
                  height: 300,
                  child: EmailPasswordForm(),
                ),
              ],
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: signOutButton,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

double _volume = 0.0; //volume

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.volume_up),
          tooltip: 'Increase by one volume',
          onPressed: () {
            setState(() {
              _volume += 1;
            });
          },
        ),
        Text('Volume : $_volume')
      ],
    );
  }
}

class MyStatefulWdget extends StatefulWidget {
  @override
  _MyStatefulWdgetState createState() => _MyStatefulWdgetState();
}

class _MyStatefulWdgetState extends State<MyStatefulWdget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.volume_up),
          tooltip: 'Increase by one volume',
          onPressed: () {
            setState(() {
              _volume += 1;
            });
          },
        ),
        Text('Volume : $_volume')
      ],
    );
  }
}
