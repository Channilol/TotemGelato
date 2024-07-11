import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  const SidebarItem({
    super.key,
    required this.img,
    required this.title,
    required this.position,
    required this.selectionColor,
  });

  final String img;
  final String title;
  final String position;
  final Color selectionColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: selectionColor,
          borderRadius: position == 'top'
              ? const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0))
              : position == 'bot'
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0))
                  : const BorderRadius.all(Radius.zero),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  img,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontSize: 17.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
