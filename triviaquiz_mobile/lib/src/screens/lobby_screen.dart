import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/bloc/lobby_provider.dart';
import 'package:triviaquiz_mobile/src/models/category_model.dart';
import 'package:triviaquiz_mobile/src/models/lobby_model.dart';
import 'package:triviaquiz_mobile/src/models/player_model.dart';

class LobbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lobby'),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.people),
            onPressed: () {
              // show "bottomsheet" with people names
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.videogame_asset),
            onPressed: () {},
          ),
        ],
      ),
      body: buildLobby(context),
    );
  }

  Widget buildLobby(BuildContext context) {
    final lobby = LobbyProvider.of(context);

    return StreamBuilder<LobbyModel>(
      stream: lobby.lobbies,
      builder: (context, AsyncSnapshot<LobbyModel> snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return Column(
          children: <Widget>[
            buildGameCode(snapshot.data.gameCode),
            buildChosenCategories(snapshot.data.categories),
            buildPlayers(snapshot.data.players),
          ],
        );
      },
    );
  }

  Widget buildGameCode(String gameCode) {
    return Chip(
      label: Text('GameCode: $gameCode'),
    );
  }

  Widget buildChosenCategories(List<CategoryModel> categories) {
    var counter = 0;
    return Container(
      color: Colors.grey[300],
      child: Column(
        children: categories.map((category) {
          counter++;
          return ListTile(
            title: Text(category.name),
            subtitle: Text('Category #$counter'),
          );
        }).toList(),
      ),
    );
  }

  Widget buildPlayers(List<PlayerModel> players) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: players.map((player) {
          return Container(
            width: 60.0,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueGrey,
            ),
            child: Center(
              child: Text(
                player.name[0],
                style: TextStyle(fontSize: 28.0, color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
