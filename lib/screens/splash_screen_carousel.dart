import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class SplashScreenCarousel extends StatelessWidget {
  const SplashScreenCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: FlutterCarousel(
        options: CarouselOptions(
          viewportFraction: 1,
          height: 500,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          showIndicator: false,
          autoPlay: true,
          autoPlayCurve: Curves.easeInBack,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 700),
        ),
        items: [
          Image.asset(
            "../lib/images/cono_rosa.png",
            fit: BoxFit.fill,
          ),
          Image.asset(
            "../lib/images/cono_cioccolato.png",
            fit: BoxFit.fill,
          ),
          Image.asset(
            "../lib/images/coppa_cioccolato.png",
            fit: BoxFit.fill,
          ),
          Image.asset(
            "../lib/images/frappe_cioccolato.png",
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
