import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:totem_gelati/models/category_item.dart';
import 'package:totem_gelati/models/extra_item.dart';
import 'package:totem_gelati/models/product_item.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static List<CategoryItem> categories = [];
  static List<ProductItem> products = [];
  static List<ExtraItem> extraItems = [];

  static Future<void> initCategories() async {
    final categoriesString =
        await rootBundle.loadString('assets/data/categorie.json');
    final objCategories = jsonDecode(categoriesString) as List<dynamic>;

    for (int i = 0; i < objCategories.length; i++) {
      categories.add(CategoryItem.fromJson(objCategories[i]));
    }
  }

  static Future<void> initProducts() async {
    final productsString =
        await rootBundle.loadString('assets/data/prodotti.json');
    final objProducts = jsonDecode(productsString) as List<dynamic>;

    for (int i = 0; i < objProducts.length; i++) {
      products.add(ProductItem.fromJson(objProducts[i]));
    }
  }

  static Future<void> initExtraItems() async {
    final extraProductsString =
        await rootBundle.loadString('assets/data/varianti.json');
    final objExtra = jsonDecode(extraProductsString) as List<dynamic>;

    for (int i = 0; i < objExtra.length; i++) {
      extraItems.add(ExtraItem.fromJson(objExtra[i]));
    }
  }

  static String getUUID() {
    return const Uuid().v8();
  }
}
