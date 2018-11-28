import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:triviaquiz_mobile/src/models/category_model.dart';

class CategoryApiProvider {
  final String apiEndPoint = 'http://10.0.2.2:5000/api';

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get("$apiEndPoint/lobby/categories");
    final categories = json.decode(response.body);

    var categoryModels = (categories as List).map((categoryModel) {
      return CategoryModel.fromJson(categoryModel);
    }).toList();

    return categoryModels;
  }
}
