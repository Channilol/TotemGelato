import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/components/products_card.dart';
import 'package:totem_gelati/models/product_item.dart';
import 'package:totem_gelati/providers/page_provider.dart';

class ProductsDisplay extends ConsumerStatefulWidget {
  const ProductsDisplay({super.key, required this.filtProducts});

  final List<ProductItem> filtProducts;

  @override
  ConsumerState<ProductsDisplay> createState() => _ProductsDisplayState();
}

class _ProductsDisplayState extends ConsumerState<ProductsDisplay> {
  @override
  Widget build(BuildContext context) {
    int? pageCounter = ref.watch(pageProvider);
    int itemsCount = widget.filtProducts.length;
    List<Widget> elementList = [];
    List<Widget> pageElementList = [];

    for (int i = 0; i < widget.filtProducts.length; i++) {
      elementList.add(
        ProductsCard(
          product: widget.filtProducts[i],
          key: ValueKey(widget.filtProducts[i].productId),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double cardHeight = (constraints.maxHeight - 55) / 3;
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: constraints.maxWidth / (2 * cardHeight),
                ),
                itemCount: itemsCount - (pageCounter! * 6) >= 6
                    ? 6
                    : itemsCount - (pageCounter! * 6),
                itemBuilder: (context, index) {
                  return ProductsCard(
                    product: widget.filtProducts[
                        pageCounter == 0 ? index : index + 6 * pageCounter],
                    key: ValueKey(widget.filtProducts[index].productId),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: pageCounter! > 0
                      ? () {
                          ref
                              .watch(pageProvider.notifier)
                              .setPage(pageCounter! - 1);
                        }
                      : null,
                  child: Icon(CupertinoIcons.left_chevron),
                ),
                SizedBox(
                  width: 15,
                ),
                Text("${pageCounter! + 1}"),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: itemsCount - (pageCounter! * 6) > 6
                      ? () {
                          ref
                              .watch(pageProvider.notifier)
                              .setPage(pageCounter + 1);
                        }
                      : null,
                  child: Icon(CupertinoIcons.right_chevron),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

/*  */