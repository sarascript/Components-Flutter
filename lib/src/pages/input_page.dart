import 'dart:math';

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = "";
  String _email = "";
  String _date = "";
  String _selectedOption= "Fly";
  List<String> _powers = ["Fly", "X-ray", "Superpower"];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _createInput() {
    // Widget de input text
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text("Letras ${_name.length}"),
        hintText: "John Doe",
        labelText: "Nombre",
        helperText: "Introduzca su nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      // Guardar el input
        onChanged: (value) => setState(() {
          _name = value;
        })
    );
  }

  Widget _createEmail() {
    // Widget de input text
    return TextField(
      keyboardType: TextInputType.emailAddress, // Tipo de texto
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: "johndoe@mail.com",
          labelText: "Email",
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.mail)
      ),
      // Guardar el input
      onChanged: (value) => setState(() {
          _email = value;
        })
    );
  }

  Widget _createPassword() {
    // Widget de input text
    return TextField(
        obscureText: true, // Ocultar contraseña
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: "Abc1234",
            labelText: "Password",
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock)
        ),
        // Guardar el input
        onChanged: (value) => setState(() {
        })
    );
  }

  Widget _createDate(BuildContext context) {
    // Widget de input text
    return TextField(
      enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: "01/01/1990",
            labelText: "Date of Birth",
            suffixIcon: Icon(Icons.perm_contact_calendar),
            icon: Icon(Icons.calendar_today)
        ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    // Widget de seleccionar fecha
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1950),
      lastDate: new DateTime(2010),
    );
    // Si hay fecha seleccionada se guarda
    if (picked!= null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> list = new List();
    _powers.forEach((power) {
      list.add(DropdownMenuItem(
        child: Text(power),
        value: power
      ));
    });
    return list;
  }

  // Widget de menú
  Widget _createDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _selectedOption,
            items: getOptionsDropdown(),
            onChanged: (opt) {
              setState(() {
                _selectedOption = opt;
              });
            },
          )
        )
      ],
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text("El nombre es $_name"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_selectedOption)
    );
  }

}

