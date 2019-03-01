import 'package:firebase_role_based/Setup/sign_in.dart';
import 'package:firebase_role_based/Setup/sign_up.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Firebase App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: navigateToSignIn,
              child: Text("Sign In"),
              color: Colors.green,
              padding: EdgeInsets.all(15),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: navigateTosignUp,
              child: Text("SignUp"),
              color: Colors.red,
              padding: EdgeInsets.all(15),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSignIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
          fullscreenDialog: true,
        ));
  }

  void navigateTosignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpPage(),
          fullscreenDialog: true,
        ));
  }
}
