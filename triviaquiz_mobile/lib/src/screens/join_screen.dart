import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/models/player_model.dart';

class JoinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: JoinScreenForm(),
    );
  }
}

class JoinScreenForm extends StatefulWidget {
  _JoinScreenFormState createState() => _JoinScreenFormState();
}

class _JoinScreenFormState extends State<JoinScreenForm> {
  final PlayerModel player = new PlayerModel();
  String gamecode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join'),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              buildTextInput("GameCode"),
              buildTextInput("Username"),
              buildSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  buildTextInput(String type) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: TextFormField(
        onSaved: (val) {
          type == "GameCode" ? gamecode = val : player.name = val;
        },
        decoration: InputDecoration(
          labelText: '$type',
          icon: type == "Username" ? Icon(Icons.face) : Icon(Icons.lock),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a $type';
          }
        },
      ),
    );
  }

  buildSubmit() {
    return Container(
      child: RaisedButton(
        child: Text('Submit'),
        onPressed: (){},
      ),
    );
  }
}
