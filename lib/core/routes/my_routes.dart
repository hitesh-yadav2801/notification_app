import 'package:flutter/material.dart';
import 'package:notification_app/presentation/screens/home_screen.dart';
import 'package:notification_app/presentation/screens/second_screen.dart';

class MyRoutes {
  static const String homeScreen = '/';
  static const String secondScreen = '/second';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case secondScreen:
        return MaterialPageRoute(builder: (_) => SecondScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
