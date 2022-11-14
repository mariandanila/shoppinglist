import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_app/models/GroceryModel.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc()
      : super(
          const ItemsState(
            items: [],
          ),
        ) {
    // on<LoadItemsList>(
    //   (event, emit) async {

    //     await Future<void>.delayed(const Duration(seconds: 1));
    //     emit(const ItemsLoaded(items: <GroceryItem>[]));
    //   },
    // );
    on<AddItem>(
      (event, emit) {
        List<GroceryItem> new_list = [...state.items];
        new_list.add(event.item);
        // print("The new list is: $new_list");T
        emit(state.copyWith(items: new_list));
      },
    );
    // functie care sa dea remove la item-ul cu index-ul respectiv
    on<RemoveItem>(
      (event, emit) {
        List<GroceryItem> new_list = [...state.items];
        new_list.removeAt(event.id);
        emit(state.copyWith(items: new_list));
      },
    );
  }
}
