import 'package:assesmentmanushtech/config/theme/colors.dart';
import 'package:assesmentmanushtech/core/blocs/common_api_state.dart';
import 'package:assesmentmanushtech/core/injection/injection_container.dart';
import 'package:assesmentmanushtech/core/services/cart_service.dart';
import 'package:assesmentmanushtech/features/home/bloc/get_products_cubit.dart';
import 'package:assesmentmanushtech/features/home/bloc/quantity_cubit.dart';
import 'package:assesmentmanushtech/features/home/data/models/cart_item.dart';
import 'package:assesmentmanushtech/features/home/data/models/products_data_response.dart';
import 'package:assesmentmanushtech/features/home/ui/pages/cart_page.dart';
import 'package:assesmentmanushtech/features/home/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Products> products = [];
  List<Products> filteredProducts = [];

  String searchQuery = '';

  void filterProducts(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where((product) =>
                product.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _navigateToCart() {
    context.push(CartPage.path);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetProductsCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Color(0xFFF5F7F9),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Shopping Hub',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.black54),
                  onPressed: _navigateToCart,
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: BlocBuilder<GetProductsCubit, CommonApiState>(
            builder: (context, state) {
          if (state is ApiInitial) {
            context.read<GetProductsCubit>().getProducts();
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          } else if (state is ApiLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          } else if (state is ApiSuccess<ProductsDataResponse>) {
            if (products.isEmpty) {
              products = state.response.products ?? [];
              filteredProducts = List.from(products);
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search products...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      filterProducts(value);
                    },
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: filteredProducts[index],
                        onAddToCart: () {
                          showAddToCartSheet(context, filteredProducts[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Text(
              'An error occurred: ${state}',
              style: TextStyle(color: Colors.red),
            );
          }
        }),
      ),
    );
  }

  void showAddToCartSheet(BuildContext context, Products product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return AddToCart(product: product);
      },
    );
  }
}

class AddToCart extends StatefulWidget {
  final Products product;

  const AddToCart({Key? key, required this.product}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final CartService cartService = getIt<CartService>();

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    //quantityCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    num quantity = widget.product.minimumOrderQuantity!;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<QuantityCubit>()..updateValue(int.parse(widget.product.minimumOrderQuantity.toString())),
        ),
      ],
      child: BlocBuilder<QuantityCubit, int>(
        builder: (context, count) {
          //context.read<QuantityCubit>().updateValue(int.parse(widget.product.minimumOrderQuantity.toString()));
          controller.text = count.toString();
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    bluePrimary,
                    bluePrimaryNew,
                  ],
                ),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: Offset(0, -10),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if(widget.product.promotion!=null)
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    shrinkWrap: true,
                    //physics:NeverScrollableScrollPhysics(),
                  itemCount: widget.product.promotion!.promotionDetails!.length,
                    itemBuilder: (context, index) {
                      final productDiscount =widget.product.promotion!.promotionDetails![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: ListTile(
                          title: Text(
                            productDiscount.discountType??"",
                            style: const TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            productDiscount.discountProduct != null
                                ? "Promotion Tag: ${productDiscount.discountProduct!.title}"
                                : "",
                            style: TextStyle(
                              fontSize: 16,
                              color: productDiscount.discountProduct != null ? Colors.red : Colors.black,
                              fontWeight: productDiscount.discountProduct != null
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          trailing: Text(
                            productDiscount != null
                                ? "BDT${productDiscount.amount}"
                                : "",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                    // Product Title with Elegant Design
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        widget.product.title ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Quantity Control with Modern Design
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCircularButton(
                            icon: Icons.remove,
                            onPressed: () {
                              if (count >
                                  widget.product.minimumOrderQuantity!) {
                                context.read<QuantityCubit>().decrement();
                              }
                            },
                          ),
                          Container(
                            width: 80,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: controller,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: count.toString(),
                                hintStyle: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onChanged: (value) {
                                int? newQuantity = int.tryParse(value);
                                if (newQuantity != null &&
                                    newQuantity >=
                                        widget.product
                                            .minimumOrderQuantity! &&
                                    newQuantity <= widget.product.stock!) {
                                  context
                                      .read<QuantityCubit>()
                                      .updateValue(newQuantity);
                                }
                              },
                            ),
                          ),
                          _buildCircularButton(
                            icon: Icons.add,
                            onPressed: () {
                              if (count <
                                  widget.product.stock!) {
                                context.read<QuantityCubit>().increment();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Add to Cart Button with Cool Animation
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white70],
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(double.infinity, 60),
                        ),
                        onPressed: () async {
                          await cartService.addToCart(
                              widget.product, quantity.toInt());
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart, color: Colors.blue),
                            SizedBox(width: 10),
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  /*double calculateDiscountedPrice() {
    if (widget.product.promotion.discountPercentage != null) {
      return widget.price - (widget.price * (widget.discountPercentage! / 100));
    }
    return widget.price;
  }*/
  Widget _buildCircularButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(8),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  void addToCart(Products product, int quantity) async {
    var cartBox = await Hive.openBox('cartBox');

    var existingItem = cartBox.values.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => null,
    );

    if (existingItem != null) {
      existingItem.quantity = quantity;
      existingItem.save();
    } else {
      var newItem = CartItem(product: product, quantity: quantity);
      cartBox.add(newItem);
    }

    print('Cart updated');
  }
}
