import 'package:triviaquiz_mobile/src/models/otdb_category_model.dart';

class CreateGameModel {
  String username;
  List<OtdbCategoryModel> categories = new List(5);
  String gameModeId;

  Map<String, dynamic> toJson() => {
    'hostUsername': username,
    'gameModeId': gameModeId,
    'categories': categories.map((category) => category.toJson()).toList()
  };
}