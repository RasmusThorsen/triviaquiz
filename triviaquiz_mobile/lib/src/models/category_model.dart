import 'package:triviaquiz_mobile/src/models/question_model.dart';

class CategoryModel {
  String id;
  String name;
  List<Question> questions = List();

  CategoryModel({this.id, this.name, this.questions});
}