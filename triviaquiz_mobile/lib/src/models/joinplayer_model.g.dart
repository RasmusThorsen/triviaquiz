// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joinplayer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinPlayerModel _$JoinPlayerModelFromJson(Map<String, dynamic> json) {
  return JoinPlayerModel(
      userName: json['userName'] as String,
      gameCode: json['gameCode'] as String);
}

Map<String, dynamic> _$JoinPlayerModelToJson(JoinPlayerModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'gameCode': instance.gameCode
    };
