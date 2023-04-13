import 'package:flutter/material.dart';
import 'package:flutter_todo_app/pages/home.dart';
import 'package:flutter_todo_app/pages/main_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context) => Home()
  },
));
