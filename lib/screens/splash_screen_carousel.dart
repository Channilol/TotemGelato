import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class SplashScreenCarousel extends StatelessWidget {
  const SplashScreenCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterCarousel(
        options: CarouselOptions(
          height: 500,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          showIndicator: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 700),
        ),
        items: [
          Image.asset("../lib/images/cono_cioccolato.png"),
          Image.asset("../lib/images/cono_rosa.png"),
          Image.asset("../lib/images/coppa_cioccolato.png"),
        ],
      ),
    );
  }
}
