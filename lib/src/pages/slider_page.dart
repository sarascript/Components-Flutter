import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Grow the Mini Mal!"),
            ),
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(
              child: _createImage()
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    // Widget slider
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Image size",
      value: _sliderValue,
      max: 400.0,
      min: 10.0,
      onChanged: (_blockCheck) ? null : (value) {
        setState(() {
          _sliderValue = value;
        });
      },
    );
  }

  Widget _createCheckbox() {
    // Widget checkbox
    //return Checkbox(
    //  value: _blockCheck,
    //  onChanged: (value) {
    //    setState(() {
    //      _blockCheck = value;
    //    });
    //  },
    //);

    return CheckboxListTile(
      title: Text("Block slider"),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text("Block slider"),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage("https://i.imgur.com/MSV5KOM.jpg"),
      width: _sliderValue,
      fit: BoxFit.contain
    );
  }

}
