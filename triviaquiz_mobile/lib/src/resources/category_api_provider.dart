import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:triviaquiz_mobile/src/models/category_model.dart';

class CategoryApiProvider {
  final String apiEndPoint = 'https://10.0.2.2:5001/api';

  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback = ((cert, String host, int port) {
      return true;
    });

  Future<List<CategoryModel>> fetchCategories() async {
    var categoryList;

    var request =
        await httpClient.getUrl(Uri.parse("$apiEndPoint/lobby/categories"));
    var response = await request.close();

    await for (var contents in response.transform(Utf8Decoder())) {
      Iterable categoriesJson = json.decode(contents);
      categoryList = categoriesJson
          .map((model) => CategoryModel.fromJson(model))
          .toList();
    }

    return categoryList;
  }
}
