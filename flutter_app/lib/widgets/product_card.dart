import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(product.imageUrl),
          Text(product.name),
          Text('\$${product.price.toStringAsFixed(2)}'),
          RaisedButton(
            child: Text('Add to Cart'),
            onPressed: () {
              // TODO: Implement add to cart functionality
            },
          ),
        ],
      ),
    );
  }
}