import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/components/footer.dart';
import 'package:totem_gelati/components/main_container.dart';
import 'package:totem_gelati/providers/order_provider.dart';

class OrderRecapScreen extends ConsumerStatefulWidget {
  const OrderRecapScreen({super.key});

  @override
  ConsumerState<OrderRecapScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<OrderRecapScreen> {
  @override
  Widget build(BuildContext context) {
    var orderWatcher = ref.watch(orderProvider);
    num orderBill = ref.watch(orderProvider.notifier).getCartBill();

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
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(CupertinoIcons.arrow_left),
                    ),
                  ),
                  Text(
                    "Riepilogo ordine: $orderBill€",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.money_euro_circle),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Vai al pagamento",
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(
          iconColor1: Colors.white,
          iconColor2: Colors.blueAccent,
          btnColor: Colors.white12),
    );
  }
}
