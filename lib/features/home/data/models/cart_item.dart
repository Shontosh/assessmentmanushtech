import 'package:hive/hive.dart';
import 'package:assesmentmanushtech/features/home/data/models/products_data_response.dart';


@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  final Products product;

  @HiveField(1)
  int quantity;

  CartItem({required this.product, required this.quantity});
}
