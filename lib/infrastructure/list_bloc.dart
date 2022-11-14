import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/infrastructure/list_event.dart';
import 'package:grocery_app/infrastructure/list_state.dart';
import 'package:grocery_app/models/GroceryModel.dart';

class ItemsBloc extends Bloc<ListOfItemsEvent, ItemsState> {
  ItemsBloc() : super(const ItemsState()) {
    on<AddItem>((event, emit) {
      print("[ItemsBloc] Add item to list Event started");
      print("Item that need to be added: ${event.item}");
      List<GroceryItem> items_from_state = state.listOfItems;

      items_from_state.add(event.item);
      print("[ItemsBloc] Add item to list Event end");
      emit(
        state.copyWith(listOfItems: items_from_state),
      );
    });
  }
}
