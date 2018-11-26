import 'package:flutter/material.dart';
import 'package:triviaquiz_mobile/src/screens/home_screen.dart';
import 'package:triviaquiz_mobile/src/screens/create_screen.dart';
import 'package:triviaquiz_mobile/src/screens/join_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia Quiz',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());
        break;
      case '/create':
        return MaterialPageRoute(builder: (context) => CreateScreen());
        break;
      case '/join':
        return MaterialPageRoute(builder: (context) => JoinScreen());
        break;
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
