import 'package:equatable/equatable.dart';

import '../models/GroceryModel.dart';

class ItemsState {
  final List<GroceryItem> listOfItems;
  const ItemsState({
    List<GroceryItem> listOfItems = const [],
  }) : listOfItems = listOfItems;

  ItemsState copyWith({
    List<GroceryItem>? listOfItems,
  }) {
    return ItemsState(listOfItems: listOfItems ?? this.listOfItems);
  }

  // @override
  // List<Object?> get props => [listOfItems];
}
