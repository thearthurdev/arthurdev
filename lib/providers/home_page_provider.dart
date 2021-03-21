import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentSection = 0;
  int _currentPortfolioPage = 0;

  int get currentPortfolioPage => _currentPortfolioPage;
  int get currentSection => _currentSection;

  void changeCurrentSection(ScrollController scrollController) {
    if (scrollController.offset <= kSectionScrollOffsets[1])
      _currentSection = 0;
    if (scrollController.offset >= kSectionScrollOffsets[1])
      _currentSection = 1;
    if (scrollController.offset >= kSectionScrollOffsets[2])
      _currentSection = 2;
    if (scrollController.offset >= kSectionScrollOffsets[3])
      _currentSection = 3;

    notifyListeners();
  }

  void changePortfolioPage(int page) {
    _currentPortfolioPage = page;
    notifyListeners();
  }
}
