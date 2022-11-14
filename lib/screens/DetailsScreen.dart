import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/models/GroceryModel.dart';
import 'package:grocery_app/screens/HomeScreen.dart';

class DetailsScreenArguments {
  final GroceryItem item;
  final Function(String name) deleteItem;

  DetailsScreenArguments({
    required this.item,
    required this.deleteItem,
  });
}

class ModifyItem {
  final String name;
  final double price;
  ModifyItem({
    required this.name,
    required this.price,
  });
}

class DetailsScreen extends StatefulWidget {
//  final GroceryItem item;
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
//  final groceriesItem = TextEditingController();
//  final groceriesPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)!.settings.arguments as GroceryItem;
    final groceriesItem = TextEditingController(text: details.name);
    final groceriesPrice =
        TextEditingController(text: details.price.toString());
    final itemToModify = ModifyItem(
        name: groceriesItem.text, price: double.parse(groceriesPrice.text));

    void modifyItem() {
      Navigator.of(context).pop(itemToModify);
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('Edit item'),
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black,
          ),
          actions: [
            Container(
                width: 60,
                height: 30,
                child: IconButton(
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    modifyItem();
                  },
                ))
          ]),
      body: Column(children: [
        TextFormField(
          controller: groceriesItem,
          decoration: const InputDecoration(
            hintText: 'Edit item\'s name',
          ),
        ),
        TextFormField(
          controller: groceriesPrice,
          decoration: const InputDecoration(
            hintText: 'Edit item\'s price',
          ),
        )
      ]),
    );
  }
}
