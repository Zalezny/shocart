import 'package:bloc/bloc.dart';
import 'package:shocart/utils/product.dart';

part 'creator_state.dart';

class CreatorCubit extends Cubit<CreatorState> {
  final List<Product> newShoppingList = [];

  CreatorCubit() : super(CreatorState(products: []));

  void addProduct(Product product) {
    newShoppingList.insert(0, product);
    emit(state.copyWith(products: newShoppingList));
  }

  void removeProduct(Product product) {
    newShoppingList.removeWhere((element) => element.name == product.name);
    emit(state.copyWith(products: newShoppingList));
  }
}
