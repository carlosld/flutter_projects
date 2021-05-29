import 'dart:ffi';

import 'package:brew_crew/models/app_user.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/services/auth_service.dart';
import 'package:brew_crew/services/dabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final AppUser? _user = Provider.of<AppUser?>(context);

    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService(uid: _user?.uid ?? '').brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                ),
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('logout'))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
