import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';
import 'package:components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _list(),
    );
  }
}

  Widget _list() {
    // Se cargará cuando reciba el future
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      // Widget que cargará
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) { // Datos recibidos
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];
    data.forEach( (opt) {
      final widgetTemp = ListTile(
        title: Text(opt["texto"]), // propiedad del json
        leading: getIcon(opt["icon"]),
        trailing: getIcon(opt["icon"]),
        onTap: () {
          // Navegar a otra pantalla
          Navigator.pushNamed(context, opt["ruta"]);
          //final route = MaterialPageRoute(
          //  builder: (context) => AlertPage()
          //);
          //Navigator.push(context, route);
        },
      );
      options..add(widgetTemp)
             ..add(Divider());
    });
    return options;
  }
