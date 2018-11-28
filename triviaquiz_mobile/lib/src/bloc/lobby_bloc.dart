import 'package:rxdart/rxdart.dart';
import 'package:triviaquiz_mobile/src/models/lobby_model.dart';

class LobbyBloc {
  final _lobbySubject = BehaviorSubject<LobbyModel>();

  // Getters for streams
  Observable<LobbyModel> get lobbies => _lobbySubject.stream;

  // Getters for sinks
  Function(LobbyModel) get addLobby => _lobbySubject.sink.add;

  dispose() {
    _lobbySubject.close();
  }
}