import 'package:flutter/material.dart';
import 'package:totem_gelati/screens/order_screen.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 600,
              color: Colors.amberAccent,
              child: const Center(
                  child: Text(
                style: TextStyle(fontSize: 20),
                "Questo blocco conterrà un'immagine",
              )),
            ),
            Expanded(
              child: Container(
                child: Center(
                    child: WidgetAnimator(
                  atRestEffect: WidgetRestingEffects.pulse(),
                  child: Text(
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                      "Tocca per iniziare"),
                )),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OrderScreen(),
          ),
        );
        print("Tap");
      },
      onLongPress: () {
        print("Leva sto dito");
      },
    );
  }
}
