import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:totem_gelati/components/products_card.dart';
import 'package:totem_gelati/models/product_item.dart';
import 'package:totem_gelati/utils/utils.dart';

class ProductsDisplay extends StatefulWidget {
  const ProductsDisplay({super.key, required this.filtProducts});

  final List<ProductItem> filtProducts;

  @override
  State<ProductsDisplay> createState() => _ProductsDisplayState();
}

class _ProductsDisplayState extends State<ProductsDisplay> {
  @override
  Widget build(BuildContext context) {
    List<Widget> elementList = [];

    for (int i = 0; i < widget.filtProducts.length; i++) {
      elementList.add(
        ProductsCard(
          product: widget.filtProducts[i],
          key: ValueKey(widget.filtProducts[i].productId),
        ),
      );
    }

    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: elementList,
          ),
        ),
      ),
    );
  }
}
