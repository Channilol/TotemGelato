import 'package:flutter/material.dart';
import 'package:totem_gelati/screens/order_screen.dart';
import 'package:totem_gelati/screens/splash_screen_carousel.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 550,
              color: Colors.amberAccent,
              child: const SplashScreenCarousel(),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 168, 219, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero),
                ),
                child: Center(
                  child: Text(
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    "Tocca per iniziare",
                  )
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .scale(
                        begin: Offset(0.9, 0.9),
                        end: Offset(1.0, 1.0),
                        duration: 1500.ms,
                      ),
                ),
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
