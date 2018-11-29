import 'dart:convert';

import 'package:signalr_client/signalr_client.dart';
import 'package:triviaquiz_mobile/src/models/creategame_model.dart';
import 'package:triviaquiz_mobile/src/models/joinplayer_model.dart';
import 'package:triviaquiz_mobile/src/models/lobby_model.dart';
import 'package:triviaquiz_mobile/src/models/player_model.dart';

final serverUrl = "http://10.0.2.2:5000";

class HubBloc {
  HubConnection hubConnection;

  HubBloc() {
    // Establish connection
    openHubConnection();
  }

  Future<void> openHubConnection() async {
    if (hubConnection == null) {
      hubConnection = HubConnectionBuilder().withUrl('$serverUrl/game').build();
      hubConnection.onclose((error) => print(error));
    }

    if (hubConnection.state != HubConnectionState.Connected) {
      await hubConnection.start();
    }
  }

  Future<LobbyModel> startGame(CreateGameModel lobby) async {
    var createdLobby = await hubConnection.invoke('Create', args: <Object>[lobby.toJson()]);
    return LobbyModel.fromJson(createdLobby);
  }

  Future<LobbyModel> joinGame(JoinPlayerModel player) async {
    var joinedLobby = await hubConnection.invoke('Connect', args: <Object>[player.toJson()]);
    return LobbyModel.fromJson(joinedLobby);
  }

  onEvent(String event, Function handler) {
    hubConnection.on(event, handler);
  }
}
