import 'package:flutter/material.dart';

var myTheme = ThemeData(
  iconTheme: IconThemeData(color: Colors.red),
  appBarTheme: AppBarTheme(
    elevation: 2,
    color: Color(0xFFf3edf7),
    titleTextStyle: TextStyle(fontSize: 25, color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.purple),
    bodyLarge: TextStyle(color: Colors.green),
  ),

);
