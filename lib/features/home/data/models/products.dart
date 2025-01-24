import 'package:hive/hive.dart';


@HiveType(typeId: 1) // Use a unique typeId
class Products {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double price;

  // Add other fields as necessary

  Products({required this.id, required this.name, required this.price});
}
