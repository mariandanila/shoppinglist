import 'package:flutter/material.dart';
import 'package:grocery_app/screens/DetailsScreen.dart';

import '../models/GroceryModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final groceriesItem = TextEditingController();
  final groceriesPrice = TextEditingController(text: '0.00');
  List<GroceryItem> listOfItems = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    groceriesItem.dispose();
    groceriesPrice.dispose();
    super.dispose();
  }

  void addItemToGroceryList(GlobalKey<FormState> formKey) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(
        () {
          listOfItems.add(
            GroceryItem(
              name: groceriesItem.text,
              price: double.parse(groceriesPrice.text),
            ),
          );
        },
      );
    }
  }

//trebuie verificat daca itemul este in lista
//se identifica itemul selectat
  void deleteItem(String name) {
    for (var i = 0; i <= listOfItems.length; i++) {
      if (listOfItems[i].name == name) {
        listOfItems.remove(listOfItems[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text('Grocery List'),
        centerTitle: true,
        actions: [
          Container(
            width: 30,
            height: 30,
            color: Colors.red,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: groceriesItem,
                  decoration: InputDecoration(
                    hintText: 'Enter item',
                  ),
                  validator: (String? text) {
                    if (text == null || text.isEmpty) {
                      return 'Text is empty';
                    }
                    return null;
                  },
                ),
              ),
              TextField(
                controller: groceriesPrice,
                decoration: InputDecoration(labelText: 'Enter price'),
              ),
              ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  addItemToGroceryList(_formKey);
                },
              ),
              Container(
                // width: width,
                child: Center(
                  child: Text(
                    "List",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: height * 0.4,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: listOfItems.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      //swipe to delete
                      final item = listOfItems[index].name;
                      return Dismissible(
                        key: Key(item),
                        onDismissed: (direction) {
                          setState(() {
                            listOfItems.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$item deleted')));
                        },
                        background:
                            Container(color: Color.fromARGB(255, 136, 68, 68)),
                        child: Card(
                          child: ListTile(
                            title: Text(listOfItems[index].name),
                            trailing: Text('\$${listOfItems[index].price}'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetailsScreen(),
                                    settings: RouteSettings(
                                      arguments: listOfItems[index],
                                    )),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: NavigationBar(destinations: [
      //   NavigationDestination(
      //     icon: Icon(Icons.person),
      //     label: 'Profile',
      //   ),
      //   NavigationDestination(
      //     icon: Icon(Icons.settings),
      //     label: 'Settings',
      //   ),
      // ]),
    );
  }
}
