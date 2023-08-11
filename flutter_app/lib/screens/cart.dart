import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:flutter_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  final List<Cart> cartItems;

  CartScreen({this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (ctx, i) => CartItemWidget(
          cartItem: cartItems[i],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Total: \$${cartItems.fold(0, (total, current) => total + current.price)}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            RaisedButton(
              child: Text('CHECKOUT'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/checkout');
              },
            ),
          ],
        ),
      ),
    );
  }
}