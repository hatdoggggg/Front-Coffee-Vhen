import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';
class Menucard extends StatelessWidget {
  final Product product;

  Menucard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[100],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              product.productName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('${product.price}',
                style: TextStyle(
                  color: Colors.grey[800],
                )),
          ],
        ),
      ),
    );
  }
}
