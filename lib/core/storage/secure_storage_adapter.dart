import 'package:assesmentmanushtech/features/home/data/models/cart_item.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:assesmentmanushtech/core/storage/storage_adapter.dart';

class SecureStorageAdapter implements StorageAdapter {
  final FlutterSecureStorage _secureStorage;

  SecureStorageAdapter(this._secureStorage);

  @override
  Future<void> saveData({required String key, required dynamic value}) async {
    await _secureStorage.write(key: key, value: value.toString());
  }

  @override
  Future<String?> getData({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> deleteData({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  @override
  List<CartItem> getCartItems() {
    // TODO: implement getCartItems
    throw UnimplementedError();
  }

  @override
  int getCartItemCount() {
    // TODO: implement getCartItemCount
    throw UnimplementedError();
  }

  @override
  Future<void> removeCartItem(CartItem cartItem) {
    // TODO: implement removeCartItem
    throw UnimplementedError();
  }

  @override
  Future<void> saveCartItem(CartItem cartItem) {
    // TODO: implement saveCartItem
    throw UnimplementedError();
  }
}
