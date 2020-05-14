import 'package:components/src/pages/home_temp.dart';
import 'package:components/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Components App",
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      // Ruta inicial de la app
      initialRoute: "/",
      // Rutas de la app
      routes: getAppRoutes(),
      // Ruta por defecto para cuando la ruta no exista
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePageTemp()
        );
      },
    );
  }
}