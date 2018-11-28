import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/bloc/categories_provider.dart';
import 'package:triviaquiz_mobile/src/bloc/lobby_provider.dart';
import 'package:triviaquiz_mobile/src/screens/home_screen.dart';
import 'package:triviaquiz_mobile/src/screens/create_screen.dart';
import 'package:triviaquiz_mobile/src/screens/join_screen.dart';
import 'package:triviaquiz_mobile/src/screens/lobby_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryProvider(
      child: LobbyProvider(
        child: MaterialApp(
          title: 'Trivia Quiz',
          theme: ThemeData(primarySwatch: Colors.blueGrey),
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());
        break;
      case '/create':
        return MaterialPageRoute(builder: (context) {
          final bloc = CategoryProvider.of(context);
          bloc.fetchCategories();

          return CreateScreen();
        });
        break;
      case '/join':
        return MaterialPageRoute(builder: (context) => JoinScreen());
        break;
      case '/lobby':
        return MaterialPageRoute(builder: (context) => LobbyScreen());
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
