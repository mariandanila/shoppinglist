import 'package:grocery_app/models/GroceryModel.dart';

abstract class ListOfItemsEvent {}

class AddItem extends ListOfItemsEvent {
  final GroceryItem item;
  AddItem({required this.item});
}

class DeleteItem extends ListOfItemsEvent {
  final int index;
  DeleteItem({required this.index});
}
