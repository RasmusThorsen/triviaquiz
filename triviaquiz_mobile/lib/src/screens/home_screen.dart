import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/widgets/nav_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        buildCreateLobby(context),
        buildJoinLobby(context),
      ],
    );
  }

  Widget buildCreateLobby(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/create'),
      child: Container(
        height: (MediaQuery.of(context).size.height) / 2,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: NavButton('CREATE GAME'),
      ),
    );
  }

  Widget buildJoinLobby(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/join'),
      child: Container(
        height: (MediaQuery.of(context).size.height) / 2,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[700],
        alignment: Alignment.center,
        child: NavButton('JOIN GAME'),
      ),
    );
  }
}
