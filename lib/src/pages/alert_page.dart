import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        // Widget botón
        child: RaisedButton(
          child: Text("Mostrar Alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(), // Redondear los bordes
          onPressed: () => _showAlert(context),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          // Volver a la página anterior
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    // Crear dialog
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Title"),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Para que se adapte al contenido
            children: <Widget>[
              Text("Contenido"),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(), // Salir del dialog
            ),
            FlatButton(
              child: Text("Ok"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }

}
