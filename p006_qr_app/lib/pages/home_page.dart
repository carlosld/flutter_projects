import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/direcciones_page.dart';
import 'package:qr_app/pages/mapas_page.dart';
import 'package:qr_app/providers/ui_provider.dart';
import 'package:qr_app/widgets/custom_navigationbar.dart';
import 'package:qr_app/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {}),
        ],
      ),
      body: Center(
        child: _HomePageBody(),
      ),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    switch (uiProvider.selectedMenuOpt) {
      case 0:
        return MapasPage();

      case 1:
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
