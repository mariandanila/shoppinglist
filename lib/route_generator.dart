import 'package:flutter/material.dart';
import 'package:grocery_app/screens/DetailsScreen.dart';
import 'package:grocery_app/screens/HomeScreen.dart';
import 'package:grocery_app/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
//      case '/details':
//        if (args is String) {
//          return MaterialPageRoute(
//              builder: (_) => DetailsScreen(
//                    item: args
//                  ));
    }
//    return _errorRoute();
//    default:
    return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  });
}
