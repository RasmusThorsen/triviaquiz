import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/bloc/lobby_bloc.dart';

class LobbyProvider extends InheritedWidget {
  final LobbyBloc bloc;

  LobbyProvider({Key key, Widget child})
    : bloc = LobbyBloc(),
      super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LobbyBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LobbyProvider) as LobbyProvider).bloc;
  }
}