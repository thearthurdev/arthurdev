import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentPortfolioPage = 0;

 int get currentPortfolioPage => _currentPortfolioPage;

  void changePortfolioPage(int page) {
    _currentPortfolioPage = page;
    notifyListeners();
  }
}
