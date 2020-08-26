import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PageController extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  PageController(PageController pageController){
    pageController.addListener((){
      _index = pageController.index;
      notifyListeners();
    });
  }
}