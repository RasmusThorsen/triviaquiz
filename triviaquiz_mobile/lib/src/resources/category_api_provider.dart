import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:triviaquiz_mobile/src/models/category_model.dart';

class CategoryApiProvider {
  Client client = Client();
  final String apiEndPoint = 'https://10.0.2.2:5001/api';

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await client.get('$apiEndPoint/lobby/categories');
    final categoriesJson = json.decode(response.body);
    print(response);
    return categoriesJson.cast<CategoryModel>();
  }
}
