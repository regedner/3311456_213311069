import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'menu_model.dart';

class CartItem extends ChangeNotifier {
  final Menu menu;
  int quantity;

  CartItem({required this.menu, required this.quantity});

  void increment() {
    quantity++;
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }
}

class CartModel extends ChangeNotifier {
  List<CartItem> _items = <CartItem>[];

  List<CartItem> get items => _items.toList();

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  void addItem(Menu menu) {
    final index = _items.indexWhere((item) => item.menu == menu);

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(menu: menu, quantity: 1));
    }

    notifyListeners();
  }

  void setItems(List<CartItem> items) {
    _items = items;
    notifyListeners();
  }

  void removeItem(Menu menu) {
    final index = _items.indexWhere((item) => item.menu == menu);

    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }

      notifyListeners();
    }

    notifyListeners();
  }

  void removeAllItems(Menu menu) {
    final index = _items.indexWhere((item) => item.menu == menu);
    if (index != -1) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(
        0.0, (total, item) => total + (item.menu.price * item.quantity));
  }

  int get totalCount {
    return _items.fold(0, (total, item) => total + item.quantity);
  }
}
