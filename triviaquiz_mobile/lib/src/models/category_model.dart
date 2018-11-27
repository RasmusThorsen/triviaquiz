class CategoryModel {
  int id;
  String name;

  CategoryModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      name = parsedJson['name'];
}