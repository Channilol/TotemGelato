import 'package:flutter/material.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key, required this.child});

  final Widget? child;

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  "../lib/images/bg_img.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
