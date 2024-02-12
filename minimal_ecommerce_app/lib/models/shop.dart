import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: 'Product 1',
      price: 99.99,
      description: "An Intriguing product.....",
    ),
    Product(
      name: 'Product 1',
      price: 99.99,
      description: "An Intriguing product.....",
    ),
    Product(
      name: 'Product 1',
      price: 99.99,
      description: "An Intriguing product.....",
    ),
    Product(
      name: 'Product 1',
      price: 99.99,
      description: "An Intriguing product.....",
    )
  ];

  //user cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove from cart
  //add item to cart
  void removeCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
