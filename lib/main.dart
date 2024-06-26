import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import 'package:untitled/pages/dashboard.dart';
import 'package:untitled/pages/menu.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' :(context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Home(),
  },
));

