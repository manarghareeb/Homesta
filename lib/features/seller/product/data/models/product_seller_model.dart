import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final String description;
  final double price;
  final String image;
  final int stock;
  final String colorName;
  final Color colorValue;

  Product({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
    required this.stock,
    required this.colorName,
    required this.colorValue,
  });
}
