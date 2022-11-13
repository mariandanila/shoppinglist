import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grocery_app/models/GroceryModel.dart';
import 'package:grocery_app/route_generator.dart';
import 'package:grocery_app/screens/DetailsScreen.dart';
import 'package:grocery_app/screens/HomeScreen.dart';

//to do: un alt imput pentru pret de tipul double
//restrictie pentru apasarea butonului fara ambele imputuri completate
//optiune de stergere pentru un item

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
//  routes: {
//    '/': (context) => const HomeScreen();
//    '/details': (context) => DetailsScreen(),
//  }
//    home: HomeScreen();
//}
