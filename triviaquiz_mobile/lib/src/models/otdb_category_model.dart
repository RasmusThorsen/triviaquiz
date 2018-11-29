import 'package:json_annotation/json_annotation.dart';
part 'otdb_category_model.g.dart';

@JsonSerializable()
class OtdbCategoryModel {
  int id;
  String name = '';
  OtdbCategoryModel({this.id, this.name});

  factory OtdbCategoryModel.fromJson(Map<String, dynamic> json) => _$OtdbCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$OtdbCategoryModelToJson(this);

  // Used in the create form to display correct data
  bool operator ==(o) => o is OtdbCategoryModel && o.name == name;
  int get hashCode => name.hashCode;    
}
