import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:totem_gelati/components/bnav_button.dart';

class Footer extends StatefulWidget {
  const Footer({
    super.key,
    required this.iconColor1,
    required this.iconColor2,
    required this.btnColor,
  });

  final Color iconColor1;
  final Color iconColor2;
  final Color btnColor;

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BNavButton(
            icon: Icon(
              Icons.language,
              color: widget.iconColor1,
            ),
            text: "Lingua/Languages",
            bgcolor: widget.btnColor, //Color.fromRGBO(0, 0, 0, 0.8),
          ),
          const SizedBox(
            width: 50,
          ),
          BNavButton(
            icon: Icon(
              CupertinoIcons.info_circle_fill,
              color: widget.iconColor2,
            ),
            text: "Accessibilità",
            bgcolor: widget.btnColor, //Color.fromRGBO(0, 0, 0, 0.8),
          ),
        ],
      ),
    );
  }
}
