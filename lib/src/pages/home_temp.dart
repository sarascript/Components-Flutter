import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components Temp"),
      ),
      // Widget de lista scrolleable
      body: ListView(
        children: _createItems()
          //<Widget>[
          // Row de altura fija que suele contener texto
          //ListTile(
          //  title: Text("ListTile Title"),
          //  subtitle: Text("Cualquier cosa"),
          // Elemento al inicio
          //  leading: Icon(Icons.account_balance_wallet),
          // Elemento al final
          //  trailing: Icon(Icons.keyboard_arrow_right),
          // Método que se ejecuta al clickar
          //  onTap: () {},
          //),
          // Separador de línea
          //Divider(),
          //ListTile(
          //  title: Text("ListTile Title"),
          //)
          //],
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();
    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
        subtitle: Text("Cualquier cosa"),
        // Elemento al inicio
        leading: Icon(Icons.account_balance_wallet),
        // Elemento al final
        trailing: Icon(Icons.keyboard_arrow_right),
        // Método que se ejecuta al clickar
        onTap: () {},
      );
      list..add(tempWidget)
          ..add(Divider());
    }
    return list;
  }

  List<Widget> _createItemsShort() {
    return options.map((item) {
      return Column(
          children: <Widget> [
            ListTile(
              title: Text(item),
            ),
            Divider()
          ]
      );
    }).toList();
  }

}