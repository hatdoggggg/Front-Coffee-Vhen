import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/pages/selectedProduct.dart';
import 'package:untitled/services/product.dart';
import 'package:untitled/services/menuCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  Future<List<dynamic>>fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/products/all')
    );
    final data = jsonDecode(response.body);
    print(data);
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
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Menu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FutureBuilder(
          future: products,
          builder: (context, snapshots){
            if(snapshots.connectionState == ConnectionState.waiting){
              return Center(
                child: SpinKitWaveSpinner(
                  color: Colors.black,
                  size: 60.0,
                ),
              );
            }
            if(snapshots.hasData){
              List products = snapshots.data!;
              return Padding(
                padding: EdgeInsets.all(3.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context,index){
                    return Card(
                      color: Colors.grey[100],
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                              products[index].productName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                              products[index].price.toString(),
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    leading:Image.network(products[index].url,
                      height: 80,
                      width: 80,
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
                    onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => selectedProduct(product: products[index]),
                            )
                          );
                    },
                      ),
                    );
                  },
                ),
              );
        }
              return Center(
                child: Text('Unable to load data'
                    ),
            );
          },
        ),
      ),
    );
  }
}
