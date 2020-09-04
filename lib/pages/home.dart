import 'package:creditcard/controllers/page_controller.dart';
import 'package:creditcard/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sistema de Crédito",
      theme: ThemeData(          
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey[900]
      ),
      home: ChangeNotifierProvider(
        child: HomePage(),
        create: (BuildContext context) => PageControllerApp(),
      ) 
    );
  }
}