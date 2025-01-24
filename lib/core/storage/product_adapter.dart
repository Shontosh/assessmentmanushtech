import 'package:hive_flutter/hive_flutter.dart';
import 'package:assesmentmanushtech/features/home/data/models/products_data_response.dart';

class ProductsAdapter extends TypeAdapter<Products> {
  @override
  final int typeId = 1;

  @override
  Products read(BinaryReader reader) {
    return Products(
      id: num.parse(reader.readString()), // Read the String value for id
      title: reader.readString(), // Read the String value for title
      //price: reader.read(), // Read the num value for price (can be double or int)
    );
  }

  @override
  void write(BinaryWriter writer, Products obj) {
    writer.writeString(obj.id.toString());
    writer.writeString(obj.title??"");
    //writer.write(obj.price); // Write the num value for price
  }
}
