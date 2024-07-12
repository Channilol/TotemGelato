import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_gelati/models/order_item.dart';
import 'package:totem_gelati/utils/utils.dart';

class OrderProvider extends StateNotifier<OrderItem?> {
  OrderProvider() : super(null);

  void init() {
    state = OrderItem(rows: []);
  }

  void addItem(String productId) {
    var tempOrder = state?.clone() ?? OrderItem(rows: []);
    tempOrder.rows.add(OrderRowItem(
        rowId: Utils.getUUID(), qty: 1, productId: productId, extras: []));
    state = tempOrder;
  }

  void removeItem(String productId) {
    var tempOrder = state?.clone() ?? OrderItem(rows: []);
    if (tempOrder.rows.isNotEmpty) {
      var lastItem = tempOrder.rows.lastWhere((e) => e.productId == productId);
      tempOrder.rows.remove(lastItem);
    }
    state = tempOrder;
  }

  void removeOrder(String rowId) {
    var tempOrder = state?.clone() ?? OrderItem(rows: []);
    if (tempOrder.rows.isNotEmpty) {
      var itemToRemove =
          tempOrder.rows.where((e) => e.rowId == rowId).firstOrNull;
      if (itemToRemove != null) {
        tempOrder.rows.remove(itemToRemove);
      }
    }
    state = tempOrder;
  }

  void resetCart() {
    state = OrderItem(rows: []);
  }

  void setOrder(OrderItem order) {
    state = order;
  }

  int getItemRowsCount(String productId) {
    return state!.rows
            .where((element) => element.productId == productId)
            .length ??
        0;
  }

  int? totalCartItems() {
    return state?.rows.length;
  }

  num getTotalItemPrice(String productId) {
    num totalItemPrice = 0;
    var filtProd = state!.rows.where((e) => e.productId == productId).toList();
    for (var item in filtProd) {
      totalItemPrice +=
          Utils.products.where((e) => e.productId == productId).first.price;
    }
    return totalItemPrice;
  }

  num getCartBill() {
    num bill = 0;
    for (var row in state!.rows) {
      var product =
          Utils.products.where((e) => e.productId == row.productId).firstOrNull;
      if (product != null) {
        bill += (row.qty * product.price);
      }
    }
    return bill;
  }
}

final orderProvider = StateNotifierProvider<OrderProvider, OrderItem?>((ref) {
  return OrderProvider();
});
