import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/components/footer.dart';
import 'package:totem_gelati/components/main_container.dart';
import 'package:totem_gelati/providers/order_provider.dart';
import 'package:totem_gelati/screens/order_screen.dart';
import 'package:totem_gelati/screens/successful_payment.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MainContainer(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Icon(
                  Icons.icecream,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(CupertinoIcons.arrow_left),
                ),
                const Text(
                  "Dove vorresti pagare?",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(CupertinoIcons.info),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SuccessfulPayment(),
                      ),
                    ),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          '../lib/images/pagamento_totem.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        '../lib/images/pagamento_cassa.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(
                height: 1,
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // ref.watch(orderProvider.notifier).setOrder(order)
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      ref.watch(orderProvider.notifier).resetCart();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OrderScreen(),
                      ));
                    },
                    child: const Icon(
                      CupertinoIcons.trash_fill,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ),
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
