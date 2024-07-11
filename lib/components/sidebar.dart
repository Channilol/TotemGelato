import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/components/sidebar_item.dart';
import 'package:totem_gelati/providers/category_provider.dart';
import 'package:totem_gelati/utils/utils.dart';

// ignore: must_be_immutable
class Sidebar extends ConsumerStatefulWidget {
  const Sidebar({super.key});

  @override
  ConsumerState<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends ConsumerState<Sidebar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> sidebarCategories = [];

    String? selectedCategoryId = ref.watch(categoryProvider);

    for (int i = 0; i < Utils.categories.length; i++) {
      sidebarCategories.add(
        Expanded(
          child: InkWell(
            onTap: () {
              ref
                  .read(categoryProvider.notifier)
                  .setCategory(Utils.categories[i].categoryId);
            },
            child: SidebarItem(
                position: i == 0
                    ? 'top'
                    : i == Utils.categories.length - 1
                        ? 'bot'
                        : 'middle',
                selectionColor:
                    selectedCategoryId == Utils.categories[i].categoryId
                        ? Color.fromARGB(255, 197, 237, 255)
                        : Colors.white38,
                img: Utils.categories[i].image,
                title: Utils.categories[i].name),
          ),
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: sidebarCategories,
    );
  }
}
