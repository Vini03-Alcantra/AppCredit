import 'package:creditcard/pages/home_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sistema de Crédito",
      theme: ThemeData(  
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: HomePage() 
    );
  }
}