import 'package:brew_crew/models/app_user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppUser? _user = Provider.of<AppUser?>(context);
    print(_user);

    if (_user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
