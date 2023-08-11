import 'package:flutter/material.dart';
import 'package:flutter_app/services/product_service.dart';
import 'package:flutter_app/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  final ProductService productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder(
        future: productService.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('An error occurred!'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, i) => ProductCard(snapshot.data[i]),
            );
          }
        },
      ),
    );
  }
}