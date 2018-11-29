// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creategame_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGameModel _$CreateGameModelFromJson(Map<String, dynamic> json) {
  return CreateGameModel(
      hostUsername: json['hostUsername'] as String,
      categories: (json['categories'] as List)
          ?.map((e) => e == null
              ? null
              : OtdbCategoryModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      gameModeId: json['gameModeId'] as String);
}

Map<String, dynamic> _$CreateGameModelToJson(CreateGameModel instance) =>
    <String, dynamic>{
      'hostUsername': instance.hostUsername,
      'categories': instance.categories.map((category) => category.toJson()).toList(),
      'gameModeId': instance.gameModeId
    };
