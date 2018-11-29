import 'package:json_annotation/json_annotation.dart';
import 'package:triviaquiz_mobile/src/models/otdb_category_model.dart';
part 'creategame_model.g.dart';
@JsonSerializable()
class CreateGameModel {
  String hostUsername;
  List<OtdbCategoryModel> categories;
  String gameModeId;

  CreateGameModel({this.hostUsername, this.categories, this.gameModeId});

  factory CreateGameModel.fromJson(Map<String, dynamic> json) => _$CreateGameModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateGameModelToJson(this);

}