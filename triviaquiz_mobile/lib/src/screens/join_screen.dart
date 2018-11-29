import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/bloc/hub_provider.dart';
import 'package:triviaquiz_mobile/src/bloc/lobby_provider.dart';
import 'package:triviaquiz_mobile/src/models/joinplayer_model.dart';
import 'package:triviaquiz_mobile/src/models/player_model.dart';
import 'package:triviaquiz_mobile/src/models/user_connected_model.dart';

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
  final _formKey = GlobalKey<FormState>();
  final JoinPlayerModel player = new JoinPlayerModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              buildTextInput("GameCode"),
              buildTextInput("Username"),
              buildSubmit(context),
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
          type == "GameCode" ? player.gameCode = val : player.userName = val;
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

  buildSubmit(BuildContext context) {
    final hub = HubProvider.of(context);
    final lobbyBloc = LobbyProvider.of(context);

    return Container(
      child: RaisedButton(
        child: Text('Submit'),
        onPressed: () {
          if (!_formKey.currentState.validate()) {
            // Invalid show snackbar or something
          } else {
            _formKey.currentState.save();
            hub.joinGame(player).then((lobby) {
              lobbyBloc.addLobby(lobby);
              lobbyBloc.addPlayers(lobby.players);
            });

            hub.onEvent('UserConnected', (List<PlayerModel> users) {
              lobbyBloc.addPlayers(users);
            });

            Navigator.pushNamed(context, '/lobby');
          }
        },
      ),
    );
  }
}
