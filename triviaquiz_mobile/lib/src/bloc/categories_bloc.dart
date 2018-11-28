import 'package:triviaquiz_mobile/src/models/otdb_category_model.dart';
import 'package:triviaquiz_mobile/src/resources/category_api_provider.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  final _categoryApi = CategoryApiProvider();
  final _categoriesSubject = PublishSubject<List<OtdbCategoryModel>>();

  // Getters for streams
  Observable<List<OtdbCategoryModel>> get categories => _categoriesSubject.stream; 

  // Getters for sinks
  Function(List<OtdbCategoryModel>) get fetchCategory => _categoriesSubject.sink.add;

  fetchCategories() async {
    final categories = await _categoryApi.fetchCategories();
    fetchCategory(categories);
  }

  dispose() {
    _categoriesSubject.close();
  }
}