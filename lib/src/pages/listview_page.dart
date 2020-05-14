import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  // Controlador del scroll
  ScrollController _scrollController = new ScrollController();
  List<int> _numberList = new List();
  int _lastNumber = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();
    _scrollController.addListener(() {
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        //_add10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lists"),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ],
      )
    );
  }

  Widget _createList() {
    // Widget para refrescar la página
    return RefreshIndicator(
      onRefresh: getPage1,
      // Widget de lista dinámica
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _numberList.length,
          itemBuilder: (BuildContext context, int index) {
            final image = _numberList[index];
            return FadeInImage(
                image: NetworkImage("https://picsum.photos/500/300/?image=$image"),
                placeholder: AssetImage("assets/original.gif")
            );
          }
      )
    );
  }

  // Obtener nuevas imágenes
  Future<Null> getPage1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastNumber++;
      _add10();
    });
    return Future.delayed(duration);
  }

  void _add10() {
    for (var i = 1; i < 10; i++) {
      _lastNumber++;
      _numberList.add(_lastNumber);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _add10();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }

}
