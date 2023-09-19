import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:flutter_app/services/cart_service.dart';
import 'package:flutter_app/services/order_service.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/cart_item.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CartService _cartService = CartService();
  OrderService _orderService = OrderService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: FutureBuilder(
        future: _cartService.getCart(),
        builder: (BuildContext context, AsyncSnapshot<Cart> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.items.length,
              itemBuilder: (context, index) {
                return CartItem(snapshot.data.items[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var order = await _orderService.createOrderFromCart();
          if (order != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Order placed successfully'),
                duration: Duration(seconds: 2),
              ),
            );
            _cartService.clearCart();
            Navigator.pushNamed(context, ROUTE_ORDERS);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to place order'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: Icon(Icons.payment),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}