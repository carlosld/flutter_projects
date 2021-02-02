import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    return BottomNavigationBar(
        onTap: (int index) => uiProvider.selectedMenuOpt = index,
        currentIndex: uiProvider.selectedMenuOpt,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Direcciones')
        ]);
  }
}
