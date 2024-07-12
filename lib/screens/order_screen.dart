import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/components/footer.dart';
import 'package:totem_gelati/components/main_container.dart';
import 'package:totem_gelati/components/products_display.dart';
import 'package:totem_gelati/components/sidebar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:totem_gelati/models/product_item.dart';
import 'package:totem_gelati/providers/category_provider.dart';
import 'package:totem_gelati/providers/order_provider.dart';
import 'package:totem_gelati/screens/order_recap_screen.dart';
import 'package:totem_gelati/utils/utils.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    String? selectedCategoryId = ref.watch(categoryProvider);
    List<ProductItem> filteredProducts = Utils.products
        .where((e) => e.categoryId == selectedCategoryId)
        .toList();
    var orderWatcher = ref.watch(orderProvider);
    int? orderCount = ref.watch(orderProvider.notifier).totalCartItems();
    num orderBill = ref.watch(orderProvider.notifier).getCartBill();

    return Scaffold(
      backgroundColor: Colors.black,
      body: MainContainer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 16, 4, 4),
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        badges.Badge(
                          badgeAnimation: const badges.BadgeAnimation.slide(
                            animationDuration: Duration(milliseconds: 500),
                          ),
                          badgeContent: Text(
                            '$orderCount',
                            style: const TextStyle(color: Colors.white),
                          ),
                          badgeStyle: const badges.BadgeStyle(
                              badgeColor: Colors.blueAccent),
                          child: const Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.black,
                            size: 40.0,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Il tuo ordine:",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              "$orderBill €",
                              style: const TextStyle(fontSize: 20.0),
                            ),
                          ],
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const OrderRecapScreen(),
                          ),
                        );
                      },
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.fromLTRB(20, 25, 20, 25),
                        ),
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.blueAccent),
                      ),
                      child: const Text(
                        "Vai al pagamento >",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Sidebar(),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white38,
                            ),
                            child:
                                ProductsDisplay(filtProducts: filteredProducts),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(
        btnColor: Colors.white12,
        iconColor1: Colors.white,
        iconColor2: Colors.blueAccent,
      ),
    );
  }
}
