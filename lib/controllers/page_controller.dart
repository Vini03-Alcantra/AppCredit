import 'package:flutter/cupertino.dart';

class PageControllerApp extends ChangeNotifier {
  int _index = 0;
  int _currentIndex = -1;
  bool _isFlipped = false;

  int get index => _index;
  int get currentIndex => _currentIndex;
  bool get isFlipped => _isFlipped;

  setPageIndex(int value){
    _index = value;
    notifyListeners();
  }

  setCurrentIndex(int value){
    _currentIndex = value;
    notifyListeners();
  }

  setIsFlipped(bool value){
    _isFlipped = value;
    notifyListeners();
  }
  
}