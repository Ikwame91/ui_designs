import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: 'Elegant Dress',
      price: 120.99,
      description: "An elegant dress perfect for any occasion.",
      imageDescription: 'assets/elegant_dress.jpg',
    ),
    Product(
      imageDescription: 'assets/headphones.jpg',
      name: 'Bluetooth Headphones',
      price: 70.99,
      description: "High-quality headphones with noise cancellation.",
    ),
    Product(
      name: 'Elegant Jacket',
      price: 85.50,
      description: "Comfortable running Jacket with great support.",
      imageDescription: 'assets/hoodie.jpg',
    ),
    Product(
      name: 'Leather Wallet',
      price: 45.00,
      description: "A stylish leather wallet with multiple compartments.",
      imageDescription: 'assets/watch.png',
    ),
    Product(
      name: ' hoodie',
      price: 45.00,
      description: "A stylish leather wallet with multiple compartments.",
      imageDescription: 'assets/hoodie.jpg',
    ),
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
