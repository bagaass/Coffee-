// cart_provider.dart
import 'package:flutter/material.dart';
import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];
  String _customerName = '';
  String _tableNumber = '';

  List<CartItem> get cartItems => _cartItems;
  String get customerName => _customerName;
  String get tableNumber => _tableNumber;

  // Setters for customer name and table number
  void setCustomerName(String name) {
    _customerName = name;
    notifyListeners();
  }

  void setTableNumber(String table) {
    _tableNumber = table;
    notifyListeners();
  }

  void addToCart(CartItem item) {
    var existingItem = _cartItems.firstWhere(
      (cartItem) => cartItem.name == item.name,
      orElse: () => CartItem(
        name: '',
        imageUrl: '',
        category: '',
        quantity: 0,
        price: 0,
      ),
    );

    if (existingItem.name != '') {
      existingItem.quantity += item.quantity;
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _customerName = '';
    _tableNumber = '';
    notifyListeners();
  }

  int getTotalPrice() {
    return _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
