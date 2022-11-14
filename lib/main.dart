import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/items_bloc.dart';
import 'package:grocery_app/models/GroceryModel.dart';
import 'package:grocery_app/route_generator.dart';
import 'package:grocery_app/screens/DetailsScreen.dart';
import 'package:grocery_app/screens/HomeScreen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemsBloc(),
        ),
      ],
      child: MaterialApp(
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
    ),
  );
}
//  routes: {
//    '/': (context) => const HomeScreen();
//    '/details': (context) => DetailsScreen(),
//  }
//    home: HomeScreen();
//}
