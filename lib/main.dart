import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import 'package:untitled/pages/dashboard.dart';
import 'package:untitled/pages/menu.dart';
import 'package:untitled/pages/signup.dart';

void main() => runApp(MaterialApp(
  initialRoute:'/signup',
  routes: {
    '/' :(context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Home(),
    '/signup' : (context) => Signup(),
  },
));

