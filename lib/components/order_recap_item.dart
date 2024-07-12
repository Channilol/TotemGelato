import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/models/product_item.dart';
import 'package:totem_gelati/providers/order_provider.dart';

class OrderRecapItem extends ConsumerStatefulWidget {
  const OrderRecapItem({super.key, required this.product, required this.rowId});

  final ProductItem product;
  final String rowId;

  @override
  ConsumerState<OrderRecapItem> createState() => _OrderRecapItemState();
}

class _OrderRecapItemState extends ConsumerState<OrderRecapItem> {
  final DismissDirection dismissDirection = DismissDirection.endToStart;

  void _deleteItem() async {
    ref.watch(orderProvider.notifier).removeOrder(widget.rowId);
  }

  @override
  Widget build(BuildContext context) {
    var orderWatcher = ref.watch(orderProvider);

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.transparent,
      ),
      secondaryBackground: Container(
        color: Colors.transparent,
      ),
      dismissThresholds: const {DismissDirection.endToStart: 0.3},
      onDismissed: (_) => _deleteItem(),
      child: Container(
        key: UniqueKey(),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "${widget.product.description}",
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.product.price}€",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.pencil_outline,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: _deleteItem,
                    icon: Icon(
                      CupertinoIcons.trash_fill,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* class OrderRecapItem extends ConsumerStatefulWidget {
  const OrderRecapItem({super.key, required this.product, required this.rowId});

  final ProductItem product;
  final String rowId;

  @override
  ConsumerState<OrderRecapItem> createState() => _SwipeCardState();
}

class _SwipeCardState extends ConsumerState<OrderRecapItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1, 0),
      ).animate(_controller),
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                widget.product.description,
                style: const TextStyle(color: Colors.white, fontSize: 17.0),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.product.price}€",
                    style: const TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    CupertinoIcons.pencil_outline,
                    color: Colors.white70,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.forward().whenComplete(() async {
                        await Future.delayed(Duration(milliseconds: 200));
                        ref
                            .read(orderProvider.notifier)
                            .removeOrder(widget.rowId);
                      });
                    },
                    child: const Icon(
                      CupertinoIcons.trash_fill,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
 */