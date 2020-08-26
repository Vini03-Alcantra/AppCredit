import 'package:creditcard/pages/widgets/item_page.dart';
import 'package:creditcard/pages/widgets/my_app_bar.dart';
import 'package:creditcard/pages/widgets/painel_top.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            MyAppBar(),
            PainelTop(),
            PageView(
              controller: _pageController,
              children: <Widget>[
                ItemPage(),
                ItemPage(),
                ItemPage(),
              ],
            )
          ],
        )
      ),
    );
  }
}