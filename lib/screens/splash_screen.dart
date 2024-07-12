import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/components/footer.dart';
import 'package:totem_gelati/providers/category_provider.dart';
import 'package:totem_gelati/providers/order_provider.dart';
import 'package:totem_gelati/screens/order_screen.dart';
import 'package:totem_gelati/screens/splash_screen_carousel.dart';
import 'package:totem_gelati/utils/utils.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          ref
              .read(categoryProvider.notifier)
              .setCategory(Utils.categories[0].categoryId);

          ref.read(orderProvider.notifier).init();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OrderScreen(),
            ),
          );
          print("Tap");
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.amberAccent,
                  ),
                  child: const SplashScreenCarousel(),
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(24.0)),
                child: Center(
                  child: Text(
                    "Tocca per iniziare",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      shadows: [
                        Shadow(
                          offset: const Offset(0.0, 0.0), // Posizione dell'ombra
                          blurRadius: 7.0, // Raggio di sfocatura dell'ombra
                          color: Colors.black.withOpacity(
                              0.6), // Colore dell'ombra con opacità
                        ),
                      ],
                    ),
                  ),
                ),
              )
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
