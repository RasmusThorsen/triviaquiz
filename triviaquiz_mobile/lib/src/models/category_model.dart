import 'package:json_annotation/json_annotation.dart';
import 'package:triviaquiz_mobile/src/models/question_model.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  String id;
  String name;
  List<Question> questions;

  CategoryModel({this.id, this.name, this.questions});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}