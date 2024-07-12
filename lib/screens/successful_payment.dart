import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/components/main_container.dart';
import 'package:totem_gelati/providers/order_provider.dart';
import 'package:totem_gelati/screens/order_screen.dart';

class SuccessfulPayment extends ConsumerStatefulWidget {
  const SuccessfulPayment({super.key});

  @override
  ConsumerState<SuccessfulPayment> createState() => _SuccessfulPaymentState();
}

class _SuccessfulPaymentState extends ConsumerState<SuccessfulPayment>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isLoaded = false;
  int seconds = 3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var orderWatcher = ref.watch(orderProvider);
    // if (isLoaded == true) {
    //   ref.watch(orderProvider.notifier).resetCart();
    // }

    return Scaffold(
      backgroundColor: Colors.black,
      body: MainContainer(
        child: Center(
          child: Container(
            width: isLoaded ? 450 : 100,
            height: isLoaded ? 150 : 100,
            decoration: BoxDecoration(
              color: isLoaded ? Colors.white60 : Colors.transparent,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: !isLoaded
                ? const CircularProgressIndicator(
                    color: Colors.lightBlueAccent,
                    strokeWidth: 8.0,
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.checkmark_alt_circle_fill,
                        color: Colors.greenAccent,
                        size: 50.0,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Pagamento avvenuto con successo!",
                        style: TextStyle(
                            color: Colors.greenAccent, fontSize: 25.0),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
