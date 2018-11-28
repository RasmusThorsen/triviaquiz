import 'package:signalr_client/signalr_client.dart';
import 'package:triviaquiz_mobile/src/models/creategame_model.dart';

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

      // Setup event handlers
      // hubConnection.on('', null);
    }

    if (hubConnection.state != HubConnectionState.Connected) {
      await hubConnection.start();
    }
  }

  startGame(CreateGameModel lobby) async {
    print(lobby.toJson());
    var res = await hubConnection.invoke('Create', args: <Object>[lobby.toJson()]);
      
  }
}
