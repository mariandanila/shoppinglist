import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/models/GroceryModel.dart';
import 'package:grocery_app/screens/HomeScreen.dart';

class DetailsScreen extends StatefulWidget {
  final GroceryItem item;
  const DetailsScreen({super.key, required this.item});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as GroceryItem;

    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Column(
          children: [
            
          ]

        ),);
  }
}
