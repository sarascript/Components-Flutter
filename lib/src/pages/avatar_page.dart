import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          // Widget de avatar circular
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://26uepavkh8yx35d834o3oay1-wpengine.netdna-ssl.com/wp-content/uploads/2019/05/GrumpCrop.jpg"),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("SC"),
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage("https://26uepavkh8yx35d834o3oay1-wpengine.netdna-ssl.com/wp-content/uploads/2019/05/GrumpCrop.jpg"),
          placeholder: AssetImage("assets/original.gif"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );

  }

}