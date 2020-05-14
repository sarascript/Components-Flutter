import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 20.0,),
          _cardType2(),
          SizedBox(height: 20.0,),
          _cardType1(),
          SizedBox(height: 20.0,),
          _cardType2(),
          SizedBox(height: 20.0,),
          _cardType1(),
          SizedBox(height: 20.0,),
          _cardType2(),
        ],
      ),
    );
  }

    Widget _cardType1() {
    // Widget card
      return Card(
        // Sombra de la card
        elevation: 10.0,
        // Borde de la card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_album, color: Colors.blue),
              title: Text("Soy el título de esta tarjeta"),
              subtitle: Text("Esta es la descripción de esta tarjeta para ver cómo queda"),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Widget botón de texto
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      );
    }

  Widget _cardType2() {
    // Contenedor tipo card hecha a mano
    final card = Container(
      child: Column(
        children: <Widget>[
          // Widget imagen con carga
          FadeInImage (
            image: NetworkImage("https://betronicmusic.com/wp-content/uploads/2019/05/Gruumpy-cat-1024x576.jpg"),
            placeholder: AssetImage("assets/original.gif"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 200,
            fit: BoxFit.cover
          ),
          // Widget imagen
          //Image(
          //  image: NetworkImage("https://betronicmusic.com/wp-content/uploads/2019/05/Gruumpy-cat-1024x576.jpg"),
          //),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Grumpy Cat"),
          )
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26, // Negro con opacidad 26%
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
    );
  }

}