import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text('User Profile'),
      backgroundColor: Colors.brown[400],
      centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'NAME',
            style: TextStyle(
              fontSize:25.0,
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            'Vhenus M. Tumbaga',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'YEAR',
            style: TextStyle(
              color: Colors.black,
                fontSize: 25.0,
            ),
          ),
          Text(
            'THIRD YEAR',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'EMAIL',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0
            ),
          ),
          Text(
            'jvrclclothing@gmail.com',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.0
            ),
          ),
        ],
      ),
    ),
  ),
));