import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.amberAccent,
              height: 100,
              child: Center(
                child: Text("Contenitore totale ordine"),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.greenAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              color: Colors.redAccent,
              child: Center(
                child: Text("Contenitore footer"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
