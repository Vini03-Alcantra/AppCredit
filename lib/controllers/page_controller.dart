import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PageController extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  setPageIndex(int value){
    _index = value;
    notifyListeners();
  }
  
}