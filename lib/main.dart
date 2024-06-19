import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Coffee-Vhen'),
        ),
        backgroundColor: Colors.brown[400],
        ),
      body: Center(
        child: Image.network('https://ideas.ted.com/wp-content/uploads/sites/3/2022/07/FINAL_Coffee.jpg?resize=1000,600'),

      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightBlueAccent[100],
        child: Icon(
          Icons.add,
          color: Colors.blue[800]
        ),
      ),
      ),
    ));
}