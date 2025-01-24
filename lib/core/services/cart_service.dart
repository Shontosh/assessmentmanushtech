import 'package:assesmentmanushtech/core/storage/cart_storage_adapter.dart';
import 'package:assesmentmanushtech/core/storage/storage_adapter.dart';
import 'package:assesmentmanushtech/features/home/data/models/cart_item.dart';
import 'package:assesmentmanushtech/features/home/data/models/products_data_response.dart';

class CartService {
  final StorageAdapter storageAdapter;

  CartService(this.storageAdapter);

  // Add an item to the cart
  Future<void> addToCart(Products product, int quantity) async {
    var existingItem = storageAdapter.getCartItems().firstWhere(
          (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0), // Default CartItem if not found
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity = quantity;
      await storageAdapter.saveCartItem(existingItem);
    } else {
      var newItem = CartItem(product: product, quantity: quantity);
      await storageAdapter.saveCartItem(newItem);
    }

    print('Cart updated');
  }

  // Update an existing cart item
  Future<void> updateCartItem(CartItem cartItem) async {
    var existingItem = storageAdapter.getCartItems().firstWhere(
          (item) => item.product.id == cartItem.product.id,
      orElse: () => CartItem(product: cartItem.product, quantity: 0), // Default CartItem if not found
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity = cartItem.quantity;
      await storageAdapter.saveCartItem(existingItem);
      print('Cart item updated');
    } else {
      await storageAdapter.saveCartItem(cartItem);
      print('New cart item added');
    }
  }

  // Get all items from the cart - returning a Future
  Future<List<CartItem>> getCartItems() async {
    // Wrap the synchronous call in a Future and return it
    return Future.value(storageAdapter.getCartItems());
  }

  // Get the total number of items in the cart
  Future<int> getCartItemCount() async {
    return Future.value(storageAdapter.getCartItemCount());
  }

  // Remove an item from the cart
  Future<void> removeFromCart(CartItem cartItem) async {
    await storageAdapter.removeCartItem(cartItem);
    print('Item removed from cart');
  }
}
