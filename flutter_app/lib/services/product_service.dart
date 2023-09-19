import 'package:flutter_app/models/product.dart';

class ProductService {
  // This is a demo, so we'll use a static list of products
  static List<Product> _products = [
    Product(id: '1', name: 'Apple', price: 1.99),
    Product(id: '2', name: 'Banana', price: 0.99),
    Product(id: '3', name: 'Cherry', price: 2.99),
    // Add more products as needed
  ];

  // Get all products
  static List<Product> getAllProducts() {
    return _products;
  }

  // Get a product by ID
  static Product getProductById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  // Add a new product
  static void addProduct(Product product) {
    _products.add(product);
  }

  // Update a product
  static void updateProduct(Product product) {
    var index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
  }

  // Delete a product
  static void deleteProduct(String id) {
    _products.removeWhere((product) => product.id == id);
  }
}