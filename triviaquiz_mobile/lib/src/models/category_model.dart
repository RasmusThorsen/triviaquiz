class CategoryModel {
  int id;
  String name = '';

  CategoryModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      name = parsedJson['name'] ?? '';

  bool operator ==(o) => o is CategoryModel && o.name == name;
  int get hashCode => name.hashCode;     
}