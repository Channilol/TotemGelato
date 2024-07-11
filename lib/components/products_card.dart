import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/models/product_item.dart';
import 'package:totem_gelati/providers/order_provider.dart';

class ProductsCard extends ConsumerStatefulWidget {
  const ProductsCard({super.key, required this.product});

  final ProductItem product;

  @override
  ConsumerState<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends ConsumerState<ProductsCard> {
  @override
  Widget build(BuildContext context) {
    var order = ref.watch(orderProvider);
    var itemQty = ref
        .watch(orderProvider.notifier)
        .getItemRowsCount(widget.product.productId);
    num itemPrice = ref
        .watch(orderProvider.notifier)
        .getTotalItemPrice(widget.product.productId);

    return Card(
      elevation: 0,
      color: Color.fromARGB(255, 153, 238, 255),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Column(
        children: [
          Container(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.product.description}',
                  style: TextStyle(fontSize: 18.0),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => ref
                          .read(orderProvider.notifier)
                          .removeItem(widget.product.productId),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        shape: CircleBorder(),
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                      child: const Icon(CupertinoIcons.minus),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "$itemQty",
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => ref
                          .read(orderProvider.notifier)
                          .addItem(widget.product.productId),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        shape: CircleBorder(),
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                      child: const Icon(CupertinoIcons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            child: Container(
              height: 30,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              color: Colors.white54,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Totale: $itemPrice€',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
