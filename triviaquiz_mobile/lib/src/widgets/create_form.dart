import 'package:flutter/material.dart';

class CreateForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateFormState();
  }
}

class CreateFormState extends State<CreateForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildUsernameInput(),
          buildCategorySelector(),
          buildGameModeSelector(),
          buildSubmit(),
        ],
      ),
    );
  }

  Widget buildUsernameInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Username',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a username';
          }
        },
      ),
    );
  }

  Widget buildCategorySelector() {
    // lav bloc til category værdier
    // env fil til endpoint?
    // https://github.com/flutter/flutter/issues/22927

    // Dybdegående: https://codingwithjoe.com/building-forms-with-flutter/

    return Container();
  }

  Widget buildGameModeSelector() {
    // GameMode i DB til fremtiden?

    return Container();
  }

  Widget buildSubmit() {
    return RaisedButton(
      child: Text('Submit'),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          // Send API RequestR
          print(_formKey.currentState);
        }
      },
    );
  }
}
