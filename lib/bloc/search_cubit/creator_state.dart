part of 'creator_cubit.dart';

class CreatorState {
  final List<Product> products;

  CreatorState({required this.products});

  CreatorState copyWith({
    List<Product>? products,
  }) {
    return CreatorState(
      products: products ?? this.products,
    );
  }
}
