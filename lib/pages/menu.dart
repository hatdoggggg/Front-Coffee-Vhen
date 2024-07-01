import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';
import 'package:untitled/services/menuCard.dart';
class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName:" Iced Coffee",price:120),
    Product(productName:"Iced Espresso",price:100),
    Product(productName:"Frappuccino",price:120),
    Product(productName:"Cold Brew",price:120),
    Product(productName:"Caramel Macchiato",price:120),
  ];


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
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: products.map((product) => Menucard(product: product)).toList(),
      ),
      ),
    );
  }
}
