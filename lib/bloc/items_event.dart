part of 'items_bloc.dart';

abstract class ItemsEvent extends Equatable {
  const ItemsEvent();

  @override
  List<Object> get props => [];
}

class LoadItemsList extends ItemsEvent {
  final GroceryItem item;

  const LoadItemsList(this.item);

  @override
  List<Object> get props => [item];
}

class AddItem extends ItemsEvent {
  final GroceryItem item;

  const AddItem(this.item);

  @override
  List<Object> get props => [item];
}

// Event de remove care sa primeasca ca paramatruu id-ul item-ului pe care vrei sa il stergi
class RemoveItem extends ItemsEvent {
  final int id;

  const RemoveItem(this.id);

}
