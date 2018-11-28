import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/bloc/categories_bloc.dart';

class CategoryProvider extends InheritedWidget {
  final CategoryBloc bloc;

  CategoryProvider({Key key, Widget child})
    : bloc = CategoryBloc(),
      super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CategoryBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CategoryProvider) as CategoryProvider).bloc;
  }
}