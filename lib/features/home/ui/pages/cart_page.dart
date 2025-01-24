import 'package:assesmentmanushtech/core/injection/injection_container.dart';
import 'package:assesmentmanushtech/core/services/cart_service.dart';
import 'package:assesmentmanushtech/features/home/data/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:assesmentmanushtech/features/home/data/models/products_data_response.dart';
import 'package:hive_flutter/hive_flutter.dart';


class CartPage extends StatefulWidget {
  static const String path = '/cart_screen';

  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartService cartService = getIt<CartService>();
  late List<CartItem> cartItems=[];
  late List<WeightPromotion> weightPromotions=[];
  late List<GwpPromotion> gwpPromotions=[];

  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  loadCartItems() async {
    cartItems = await cartService.getCartItems();
    setState(() {});
  }

  double calculateTotalWeight(List<CartItem> cartItems) {
    double totalWeight = 0;
    for (var item in cartItems) {
      totalWeight += item.product.weight??0 * item.quantity;
    }
    return totalWeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: FutureBuilder<List<CartItem>>(
        future: cartService.getCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Your cart is empty'));
          }

          List<CartItem> items = snapshot.data!;
          double totalWeight = calculateTotalWeight(items);

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              CartItem item = items[index];
              double weightDiscount = 0;
              List<CartItem> gifts = [];

              // Apply weight promotion
              for (var promotion in weightPromotions) {
                weightDiscount += promotion.calculateDiscount(double.parse(item.product.weight.toString()) * item.quantity);
              }

              // Apply GWP promotion
              for (var promotion in gwpPromotions) {
                gifts.addAll(promotion.calculateGift(double.parse(item.product.weight.toString()) * item.quantity, item.quantity));
              }
              return ListTile(
                title: Text(item.product.title ?? ""),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Quantity: ${item.quantity}'),
                        Text('Total Weight: ${item.product.weight ?? 0 * item.quantity} gm'),
                        Text('Weight Discount: ৳$weightDiscount'),
                        if (gifts.isNotEmpty)
                          Text('Gift With Purchase: ${gifts.map((e) => e.product.title).join(', ')}'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, size: 12),
                          onPressed: () async {
                            //await cartService.decrementQuantity(CartItem(product: item.product, quantity: 1));
                            loadCartItems();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add, size: 12),
                          onPressed: () async {
                            //await cartService.incrementQuantity(item.product);
                            loadCartItems();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                /*trailing: SizedBox(
                  width: 40, // Set a fixed width to avoid overflow
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, size: 12),
                        onPressed: () async {
                          //await cartService.decrementQuantity(CartItem(product: item.product, quantity: 1));
                          loadCartItems();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add, size: 12),
                        onPressed: () async {
                          //await cartService.incrementQuantity(item.product);
                          loadCartItems();
                        },
                      ),
                    ],
                  ),
                ),*/
              );

            },
          );
        },
      ),
    );
  }
}
class GwpPromotion {
  final double minWeight;
  final double ruleWeight;
  final int amount;
  final Products discountProduct;

  GwpPromotion({
    required this.minWeight,
    required this.ruleWeight,
    required this.amount,
    required this.discountProduct,
  });

  List<CartItem> calculateGift(double totalWeight, int quantity) {
    List<CartItem> gifts = [];

    if (totalWeight >= minWeight) {
      int giftQuantity = (totalWeight / ruleWeight).floor();
      if (giftQuantity > 0) {
        gifts.add(CartItem(
          product: discountProduct,
          quantity: giftQuantity * amount,
        ));
      }
    }

    return gifts;
  }
}
class WeightPromotion {
  final double minWeight;
  final double? maxWeight;
  final double ruleWeight;
  final double amount;

  WeightPromotion({
    required this.minWeight,
    this.maxWeight,
    required this.ruleWeight,
    required this.amount,
  });

  double calculateDiscount(double totalWeight) {
    double discount = 0.0;
    if (totalWeight >= minWeight) {
      // Check if it fits in the weight range
      double applicableWeight = totalWeight;
      if (maxWeight != null && totalWeight > maxWeight!) {
        applicableWeight = maxWeight!;
      }

      double discountableWeight = applicableWeight / ruleWeight;
      discount = discountableWeight * amount;
    }
    return discount;
  }
}
