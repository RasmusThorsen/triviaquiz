import 'package:json_annotation/json_annotation.dart';
import 'package:triviaquiz_mobile/src/models/category_model.dart';
import 'package:triviaquiz_mobile/src/models/player_model.dart';
part 'lobby_model.g.dart';

@JsonSerializable()
class LobbyModel {
  String id;
  String gameCode;
  List<PlayerModel> players;
  List<CategoryModel> categories;
  String gameMode;

  LobbyModel({this.id, this.gameCode, this.players, this.categories, this.gameMode});

  factory LobbyModel.fromJson(Map<String, dynamic> json) => _$LobbyModelFromJson(json);
  Map<String, dynamic> toJson() => _$LobbyModelToJson(this);
}