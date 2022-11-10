import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grocery_app/models/GroceryModel.dart';
import 'package:grocery_app/screens/DetailsScreen.dart';
import 'package:grocery_app/screens/HomeScreen.dart';

//to do: un alt imput pentru pret de tipul double
//restrictie pentru apasarea butonului fara ambele imputuri completate
//optiune de stergere pentru un item

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => const HomeScreen(),
    '/details': (context) => DetailsScreen(),
  }
//    home: HomeScreen(),
      ));
}
