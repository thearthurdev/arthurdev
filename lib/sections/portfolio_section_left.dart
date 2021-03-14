import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/widgets/page_view_action_button.dart';
import 'package:flutter/material.dart';

class PortfolioSectionLeft extends StatefulWidget {
  const PortfolioSectionLeft({
    Key key,
  }) : super(key: key);

  @override
  _PortfolioSectionLeftState createState() => _PortfolioSectionLeftState();
}

class _PortfolioSectionLeftState extends State<PortfolioSectionLeft> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColorLight2,
            kPrimaryColorLight1,
          ],
        ),
      ),
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Container(color: Colors.red),
              Container(color: Colors.blue),
              Container(color: Colors.green),
              Container(color: Colors.orange),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageViewActionButton(
                  Icons.arrow_back_ios_rounded,
                  onTap: () {
                    if (_pageController.page > 0) {
                      _pageController.animateToPage(
                        (_pageController.page - 1).toInt(),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                    }
                  },
                ),
                PageViewActionButton(
                  Icons.arrow_forward_ios_rounded,
                  onTap: () {
                    if (_pageController.page < 4) {
                      _pageController.animateToPage(
                        (_pageController.page + 1).toInt(),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
