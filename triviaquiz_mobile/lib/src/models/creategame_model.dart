import 'package:triviaquiz_mobile/src/models/category_model.dart';

class CreateGameModel {
  String username;
  List<CategoryModel> categories = new List(5);
  String gameModeId;
}