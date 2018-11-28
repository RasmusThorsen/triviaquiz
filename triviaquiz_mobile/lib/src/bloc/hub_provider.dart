import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/bloc/hub_bloc.dart';
export 'package:triviaquiz_mobile/src/bloc/hub_bloc.dart';

class HubProvider extends InheritedWidget {
  final HubBloc bloc;

  HubProvider({Key key, Widget child})
      : bloc = HubBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static HubBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(HubProvider) as HubProvider)
        .bloc;
  }
}
