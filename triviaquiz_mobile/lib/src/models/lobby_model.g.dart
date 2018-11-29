// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lobby_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LobbyModel _$LobbyModelFromJson(Map<String, dynamic> json) {
  return LobbyModel(
      id: json['id'] as String,
      gameCode: json['gameCode'] as String,
      players: (json['players'] as List)
          ?.map((e) => e == null
              ? null
              : PlayerModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      categories: (json['categories'] as List)
          ?.map((e) => e == null
              ? null
              : CategoryModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      gameMode: json['gameMode'] as String);
}

Map<String, dynamic> _$LobbyModelToJson(LobbyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gameCode': instance.gameCode,
      'players': instance.players.map((player) => player.toJson()).toList(),
      'categories': instance.categories.map((category) => category.toJson()).toList(),
      'gameMode': instance.gameMode
    };
