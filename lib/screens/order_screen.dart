import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.amberAccent,
              ),
              height: 100,
              child: const Center(
                child: Text("Contenitore totale ordine"),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 212, 158, 86),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 215, 200),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.lightBlueAccent,
              ),
              child: const Center(
                child: Text("Contenitore footer"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
