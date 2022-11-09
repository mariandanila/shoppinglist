import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> groceries = ['Apples', 'Oranges', 'Bananas'];

  List<double> prices = [1.03, 2.08, 1.73];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const Expanded(child: TextField()),
          ElevatedButton(
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  groceries.add('test');
                  prices.add(1.00);
                });
              }),
        ]),
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
