import 'package:flutter/material.dart';

import '../models/GroceryModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> groceries = ['Apples', 'Oranges', 'Bananas'];
  List<double> prices = [1.03, 2.08, 1.73];
  final groceriesItem = TextEditingController();
  List<GroceryItem> listOfItems = [];

  @override
  void dispose() {
    groceriesItem.dispose();
    super.dispose();
  }

  void addItemToGroceryList() {
    setState(() {
      groceries.add(groceriesItem.text);
      prices.add(1.00);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(controller: groceriesItem),
            ),
            ElevatedButton(
              child: const Icon(Icons.add),
              onPressed: () => addItemToGroceryList(),
            ),
          ],
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(groceries[index]),
              trailing: Text('\$${prices[index]}'),
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ]),
    );
  }
}
