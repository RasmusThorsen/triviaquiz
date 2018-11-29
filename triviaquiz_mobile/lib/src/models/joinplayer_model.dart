
import 'package:json_annotation/json_annotation.dart';

part 'joinplayer_model.g.dart';

@JsonSerializable()
class JoinPlayerModel {
  String userName;
  String gameCode;

  JoinPlayerModel({this.userName, this.gameCode});

  factory JoinPlayerModel.fromJson(Map<String, dynamic> json) => _$JoinPlayerModelFromJson(json);
  Map<String, dynamic> toJson() => _$JoinPlayerModelToJson(this);
}