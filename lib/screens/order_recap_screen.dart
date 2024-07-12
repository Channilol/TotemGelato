import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/components/footer.dart';
import 'package:totem_gelati/components/main_container.dart';
import 'package:totem_gelati/components/order_recap_item.dart';
import 'package:totem_gelati/models/product_item.dart';
import 'package:totem_gelati/providers/order_provider.dart';
import 'package:totem_gelati/screens/payment_screen.dart';
import 'package:totem_gelati/utils/utils.dart';

class OrderRecapScreen extends ConsumerStatefulWidget {
  const OrderRecapScreen({super.key});

  @override
  ConsumerState<OrderRecapScreen> createState() => _OrderRecapScreenState();
}

class _OrderRecapScreenState extends ConsumerState<OrderRecapScreen> {
  @override
  Widget build(BuildContext context) {
    var orderWatcher = ref.watch(orderProvider);
    num orderBill = ref.watch(orderProvider.notifier).getCartBill();
    List<ProductItem> productsList = Utils.products.toList();
    var orderRows = ref.watch(orderProvider)?.rows;
    List<Widget> orderWidgets = [];

    for (int i = 0; i < orderRows!.length; i++) {
      orderWidgets.add(
        OrderRecapItem(
          product: productsList
              .where((e) => e.productId == orderRows[i].productId)
              .first,
          rowId: orderRows[i].rowId,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: MainContainer(
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      padding: const EdgeInsets.only(left: 5.0),
                      child: const Icon(CupertinoIcons.arrow_left),
                    ),
                  ),
                  Text(
                    "Riepilogo ordine: $orderBill€",
                    style: const TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ListView(
                  children: orderWidgets,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(0),
                ),
                onPressed: orderWidgets.isEmpty
                    ? null
                    : () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PaymentScreen(),
                          ),
                        );
                      },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.money_euro_circle),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Vai al pagamento",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const Footer(
          iconColor1: Colors.white,
          iconColor2: Colors.blueAccent,
          btnColor: Colors.white12),
    );
  }
}

/* 
GestureDetector(
              onTap: () {
                if (orderWidgets.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PaymentScreen(),
                    ),
                  );
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 60,
                decoration: BoxDecoration(
                  color: orderWidgets.isEmpty ? Colors.black45 : Colors.white,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.money_euro_circle),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Vai al pagamento",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
 */
