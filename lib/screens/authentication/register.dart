import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an account'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: widget.toggleView,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
                validator: (val) => val.isEmpty ? 'Enter a password' : null,
              ),
              RaisedButton(
                child: Text('Register'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        _auth.registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error = 'Error making account');
                        }
                  }
                },
              ),
              Text(error),
            ],
          ),
        ),
      ),
    );
  }
}
