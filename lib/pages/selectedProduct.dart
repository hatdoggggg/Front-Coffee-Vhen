import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';



class selectedProduct extends StatefulWidget {
  final Product product;
  const selectedProduct({super.key, required this.product});

  @override
  State<selectedProduct> createState() => _selectedProductState(product: product);
}

class _selectedProductState extends State<selectedProduct> {
  final Product product;
  late double totalAmount;
  int numberOfOrders =1;
  _selectedProductState({required this.product});

  @override
  void initState() {
    super.initState();
    totalAmount = product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Order',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: 430.0,
                height: 400.0,
                child: Image.network(
                    product.url,
                    fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                ),
              ),
              Text(widget.product.productName,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0,bottom: 0.0),
                child: Text(
                  widget.product.description,
                  textAlign: TextAlign.justify,
                ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '₱${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20.0
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {
                setState(() {
                  if(numberOfOrders >1){
                    numberOfOrders -=1;
                    totalAmount = product.price * numberOfOrders;
                  }
                });
              },
                  icon: Icon(Icons.remove)
          ),
          Text(
            numberOfOrders.toString(),
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  numberOfOrders += 1;
                  totalAmount = product.price * numberOfOrders;
                });
              },
                  icon: Icon(Icons.add)
          ),
          ]
          )
        ],
      ),
    ],
      ),
    );
  }
}
