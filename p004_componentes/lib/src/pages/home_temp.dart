import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home temp'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (var opc in opciones) {
      lista..add(ListTile(title: Text(opc),))
           ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((opc) => 
      Column(children: <Widget>[
        ListTile(
          title: Text(opc),
          subtitle: Text('subtítulo'),
          leading: Icon(Icons.account_balance_wallet),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
          ),
        Divider()
      ],)
    ).toList();
  }
}