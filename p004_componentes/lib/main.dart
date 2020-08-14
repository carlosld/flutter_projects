import 'package:flutter/material.dart';

import 'package:p004_componentes/src/pages/alert_page.dart';
import 'package:p004_componentes/src/routes/routes.dart';
// import 'package:componentes/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoute(),
      onGenerateRoute: (RouteSettings settings) {
        print('La página que quiere visitar es: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext contex) => AlertPage(),
        );
      },
    );
  }
}
