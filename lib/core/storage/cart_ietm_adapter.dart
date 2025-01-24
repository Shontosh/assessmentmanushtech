import 'package:hive/hive.dart';
import 'package:assesmentmanushtech/features/home/data/models/cart_item.dart';
import 'package:assesmentmanushtech/features/home/data/models/products_data_response.dart';

class CartItemAdapter extends TypeAdapter<CartItem> {
  @override
  final int typeId = 0;

  @override
  CartItem read(BinaryReader reader) {
    final product = reader.read() as Products;
    final quantity = reader.readInt();
    return CartItem(product: product, quantity: quantity);
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    writer.write(obj.product);
    writer.writeInt(obj.quantity);
  }
}
