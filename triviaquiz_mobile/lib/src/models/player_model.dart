import 'package:json_annotation/json_annotation.dart';
part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  String id;
  String name;
  bool isHost;

  PlayerModel({this.id, this.name, this.isHost});

  factory PlayerModel.fromJson(Map<String, dynamic> json) => _$PlayerModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);
}