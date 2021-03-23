import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentSection = 0;
  int _currentPortfolioPage = 0;
  double _mobileViewScrollControllerOffset = 0.0;

  int get currentPortfolioPage => _currentPortfolioPage;
  int get currentSection => _currentSection;
  double get mobileViewScrollControllerOffset =>
      _mobileViewScrollControllerOffset;

  void changeCurrentSection(double offset) {
    if (offset <= kSectionScrollOffsets[1]) _currentSection = 0;
    if (offset >= kSectionScrollOffsets[1]) _currentSection = 1;
    if (offset >= kSectionScrollOffsets[2]) _currentSection = 2;
    if (offset >= kSectionScrollOffsets[3]) _currentSection = 3;

    notifyListeners();
  }

  void changePortfolioPage(int page) {
    _currentPortfolioPage = page;
    notifyListeners();
  }

  void changeScrollOffset(double offset) {
    _mobileViewScrollControllerOffset = offset;
    notifyListeners();
  }
}
