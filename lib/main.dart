import 'package:flutter/material.dart';
import 'package:invoice_app/Home_Screen.dart';
import 'package:invoice_app/splash.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splace',
      routes: {
        '/':(context) => HomeScreen(),
        'splace':(context) => Splace(),
      },
    ),
  );
}
