import 'package:firebase_role_based/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIgn In'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                validator: (value) => value.isEmpty ? 'Please Enter Email' : null,
                onSaved: (value) => _email = value,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                obscureText: true,
                validator: (value) =>
                    value.length < 6 ? 'Password Should be 6 atleast ' : null,
                onSaved: (value) => _password = value,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: signIn,
                color: Colors.blue,
                elevation: 10.0,
                padding: EdgeInsets.all(15.0),
                child: Text('SignIn',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
 
  Future<void> signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
