import 'package:rxdart/rxdart.dart';
import 'package:triviaquiz_mobile/src/models/lobby_model.dart';
import 'package:triviaquiz_mobile/src/models/player_model.dart';

class LobbyBloc {
  final _lobbySubject = BehaviorSubject<LobbyModel>();
  final _playersSubject = PublishSubject<List<PlayerModel>>();

  // Getters for streams
  Observable<LobbyModel> get lobbies => _lobbySubject.stream;
  Observable<List<PlayerModel>> get players => _playersSubject.stream; 

  // Getters for sinks
  Function(LobbyModel) get addLobby => _lobbySubject.sink.add;
  Function(List<PlayerModel>) get addPlayers => _playersSubject.sink.add;

  dispose() {
    _lobbySubject.close();
    _playersSubject.close();
  }
}