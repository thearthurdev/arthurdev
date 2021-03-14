import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentPortfolioPage = 0;

  get currentPortfolioPage => _currentPortfolioPage;

  void changePortfolioPage(int page) {
    _currentPortfolioPage = page;
    notifyListeners();
  }
}
