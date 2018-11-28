class OtdbCategoryModel {
  int id;
  String name = '';

  OtdbCategoryModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      name = parsedJson['name'] ?? '';


  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  // Used in the create form to display correct data
  bool operator ==(o) => o is OtdbCategoryModel && o.name == name;
  int get hashCode => name.hashCode;    
}