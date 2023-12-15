import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_one/entity/product.dart';

final productListProvider =
    StateNotifierProvider<ProductListNotifier, List<Product>>((ref) {
  return ProductListNotifier();
});

class ProductListNotifier extends StateNotifier<List<Product>> {
  ProductListNotifier() : super([]);

  // Fetch products (with pagination)
  Future<void> fetchProducts(int page) async {
    // Calculate the range for fetching items
    int startIndex = (page - 1) * 10;
    int endIndex = startIndex + 10;

    // Fetch products from your data source/API
    List<Product> newProducts =
        // await yourDataSource.getProducts(startIndex, endIndex);
        [];

    // Add the new products to the current state
    state = [...state, ...newProducts];
  }

  // Add a new product
  void addProduct(Product product) {
    state = [...state, product];
  }

  // Remove a product
  void removeProduct(String productId) {
    state = state.where((product) => product.id != productId).toList();
  }

  // Edit a product
  void editProduct(Product updatedProduct) {
    state = state
        .map((product) =>
            product.id == updatedProduct.id ? updatedProduct : product)
        .toList();
  }
}
