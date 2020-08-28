import 'package:creditcard/pages/widgets/item_page.dart';
import 'package:creditcard/pages/widgets/my_app_bar.dart';
import 'package:creditcard/pages/widgets/painel_top.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              onPageChanged: (index){
                Provider.of<PageController>(context, listen: false).jumpToPage(index);
              },
              controller: _pageController,
              children: <Widget>[
                ItemPage(imageURL: "https://us.123rf.com/450wm/grebeshkovmaxim/grebeshkovmaxim1805/grebeshkovmaxim180500202/100769321-colorful-smooth-gradient-color-background-design-for-your-project-design-.jpg?ver=6",),
                ItemPage(imageURL: "https://ak5.picdn.net/shutterstock/videos/1018020805/thumb/1.jpg"),
                ItemPage(imageURL: "https://i.pinimg.com/736x/5c/ee/af/5ceeafdc811d2269821fb03df29374ff.jpg",),
              ],
            )
          ],
        )
      ),
    );
  }
}