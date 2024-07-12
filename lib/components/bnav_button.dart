import 'package:flutter/material.dart';

class BNavButton extends StatelessWidget {
  const BNavButton({
    super.key,
    required this.icon,
    required this.text,
    required this.bgcolor,
  });

  final Icon icon;
  final String text;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(bgcolor),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
