import 'package:hive/hive.dart';
import 'package:assesmentmanushtech/features/home/data/models/cart_item.dart';
import 'package:assesmentmanushtech/core/storage/storage_adapter.dart';

class CartStorageAdapter implements StorageAdapter {
  final Box _cartBox;

  CartStorageAdapter(this._cartBox);

  // Save cart item
  Future<void> saveCartItem(CartItem cartItem) async {
    await _cartBox.put(cartItem.product.id, cartItem);
  }

  // Get cart items
  List<CartItem> getCartItems() {
    return _cartBox.values.toList().cast<CartItem>();
  }

  // Remove cart item
  Future<void> removeCartItem(CartItem cartItem) async {
    await _cartBox.delete(cartItem.product.id);
  }

  // Get cart item count
  int getCartItemCount() {
    return _cartBox.length;
  }

  // Implement the StorageAdapter methods

  @override
  Future<void> deleteData({required String key}) async {
    await _cartBox.delete(key); // Use the key to delete data in Hive
  }

  @override
  Future<dynamic> getData({required String key}) async {
    return await _cartBox.get(key); // Retrieve data by key from Hive
  }

  @override
  Future<void> saveData({required String key, required value}) async {
    await _cartBox.put(key, value); // Save data with the key in Hive
  }
}
