import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';
import 'package:untitled/services/menuCard.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  Future<List<dynamic>>fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/product')
    );
    final data = jsonDecode(response.body);
    List products = <Product>[];
    for (var product in data) {
      products.add(Product.fromJson(product));
    }
    return products;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
