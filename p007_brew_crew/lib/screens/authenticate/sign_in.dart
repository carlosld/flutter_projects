import 'package:brew_crew/models/app_user.dart';
import 'package:brew_crew/services/auth_service.dart';
import 'package:brew_crew/shared/contants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  String _email = '';
  String _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign in to Brew Crew'),
              actions: <Widget>[
                TextButton.icon(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                    ),
                    onPressed: () async {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Register'))
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Email',
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => _email = val);
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Password',
                      ),
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => _password = val);
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink[400],
                          onPrimary: Colors.white,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => _loading = true);
                            AppUser? user = await _auth
                                .signInWithEmailAndPassword(_email, _password);
                            if (user == null) {
                              setState(() {
                                _loading = false;
                                _error =
                                    'could not sign in with those credentials';
                              });
                            }
                          }
                        },
                        child: Text('Sign in')),
                    SizedBox(height: 20),
                    Text(
                      _error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
