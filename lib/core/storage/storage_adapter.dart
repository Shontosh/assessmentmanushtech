import 'package:assesmentmanushtech/features/home/data/models/cart_item.dart';

abstract class StorageAdapter {
  Future<void> saveData({required String key, required dynamic value});
  dynamic getData({required String key});
  Future<void> deleteData({required String key});
  List<CartItem> getCartItems();
  // Define abstract methods for Cart operations
  Future<void> saveCartItem(CartItem cartItem);
  Future<void> removeCartItem(CartItem cartItem); // Remove specific cart item
  int getCartItemCount(); // Get count of cart items
}
