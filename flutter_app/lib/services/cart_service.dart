import 'package:flutter_app/models/cart.dart';
import 'package:flutter_app/models/product.dart';

class CartService {
  List<Cart> _cartItems = [];

  List<Cart> get cartItems => _cartItems;

  void addToCart(Product product, int quantity) {
    var index = _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _cartItems[index].quantity += quantity;
    } else {
      _cartItems.add(Cart(product: product, quantity: quantity));
    }
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.product.id == product.id);
  }

  void updateQuantity(Product product, int quantity) {
    var index = _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _cartItems[index].quantity = quantity;
    }
  }

  double get total {
    return _cartItems.fold(0, (total, current) => total + current.product.price * current.quantity);
  }

  void clearCart() {
    _cartItems.clear();
  }
}