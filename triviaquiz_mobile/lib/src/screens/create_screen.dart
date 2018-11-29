import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/widgets/create_form.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: CreateForm(),
    );
  }
}
