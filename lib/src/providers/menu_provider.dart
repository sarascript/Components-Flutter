import 'dart:convert';
import "package:flutter/services.dart" show rootBundle; // Import para leer JSON

// Clase para leer un archivo JSON local
class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    //cargarData();
  }

  Future <List<dynamic>> cargarData() async {
    // Leer el JSON
    final res = await rootBundle.loadString("data/menu_opts.json");
          // Decodificamos el json para que sea accesible
          Map dataMap = json.decode(res);
          // Guardamos las rutas del json
          options = dataMap["rutas"];
          return options;
  }
}

// Crear la instancia de la clase
final menuProvider = new _MenuProvider();