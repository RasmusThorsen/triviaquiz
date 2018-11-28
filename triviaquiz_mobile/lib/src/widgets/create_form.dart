import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/bloc/categories_provider.dart';
import 'package:triviaquiz_mobile/src/models/category_model.dart';
import 'package:triviaquiz_mobile/src/models/creategame_model.dart';

class CreateForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateFormState();
  }
}

class CreateFormState extends State<CreateForm> {
  final _formKey = GlobalKey<FormState>();
  CreateGameModel model = new CreateGameModel();
  // List<String> categories = <String>[];

  @override
  Widget build(BuildContext context) {
    final bloc = CategoryProvider.of(context);
    bloc.fetchCategories();

    return SafeArea(
      top: false,
      bottom: false,
      child: Form(
        key: _formKey,
        child: StreamBuilder(
          stream: bloc.categories,
          builder: (context, AsyncSnapshot<List<CategoryModel>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                buildUsernameInput(),
                buildCategorySelector(1, snapshot.data),
                buildCategorySelector(2, snapshot.data),
                buildCategorySelector(3, snapshot.data),
                buildCategorySelector(4, snapshot.data),
                buildCategorySelector(5, snapshot.data),
                buildGameModeSelector(),
                buildSubmit(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildUsernameInput() {
    return TextFormField(
      onSaved: (val) => model.username,
      decoration: InputDecoration(
        icon: Icon(Icons.face),
        labelText: 'Username',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a username';
        }
      },
    );
  }

  Widget buildCategorySelector(int value, List<CategoryModel> categories) {
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            icon: getIcon(value),
            labelText: 'Category #$value',
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isDense: true,
              value: model.categories[value - 1],
              hint: Text('Select category'),
              items: categories.map((CategoryModel category) => category.name).map((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  model.categories[value - 1] = newValue;
                });
                state.didChange(newValue);
              },
            ),
          ),
        );
      },
    );
  }

  Widget buildGameModeSelector() {
    // GameMode i DB til fremtiden?

    return Container();
  }

  Widget buildSubmit() {
    return RaisedButton(
      child: Text('Submit'),
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          // Invalid show snackbar or something
        } else {
          _formKey.currentState.save();
          print(model.categories);
        }
      },
    );
  }

  Icon getIcon(int value) {
    switch (value) {
      case 1:
        return Icon(Icons.filter_1);
        break;
      case 2:
        return Icon(Icons.filter_2);
        break;
      case 3:
        return Icon(Icons.filter_3);
        break;
      case 4:
        return Icon(Icons.filter_4);
        break;
      case 5:
        return Icon(Icons.filter_5);
        break;
      default:
        return Icon(Icons.filter);
    }
  }
}
