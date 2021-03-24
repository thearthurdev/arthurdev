import 'package:arthurdev/providers/home_page_provider.dart';
import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/views/mobwear_portfolio_view.dart';
import 'package:arthurdev/views/more_soon_portfolio_view.dart';
import 'package:arthurdev/views/playa_portfolio_view.dart';
import 'package:arthurdev/views/sneak_peak_portfolio_view.dart';
import 'package:arthurdev/widgets/page_view_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PortfolioDetailsSection extends StatefulWidget {
  const PortfolioDetailsSection({Key key}) : super(key: key);

  @override
  _PortfolioDetailsSectionState createState() =>
      _PortfolioDetailsSectionState();
}

class _PortfolioDetailsSectionState extends State<PortfolioDetailsSection> {
  PageController _pageController;
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = context.read<HomePageProvider>().currentPortfolioPage;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: kIsDesktop(context) ? null : kPortfolioSectionKey,
      height: kScreenHeight(context) * 0.6,
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
              MobWearPortfolioView(),
              PlayaPortfolioView(),
              SneakPeakPortfolioView(),
              MoreSoonPortfolioView(),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage > 0
                    ? PageViewActionButton(
                        Icons.arrow_back_ios_rounded,
                        onTap: () {
                          setState(() {
                            _currentPage = (_pageController.page - 1).toInt();
                          });

                          _pageController
                              .animateToPage(
                            _currentPage,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          )
                              .whenComplete(
                            () {
                              context
                                  .read<HomePageProvider>()
                                  .changePortfolioPage(_currentPage);
                            },
                          );
                        },
                      )
                    : SizedBox.shrink(),
                _currentPage < 3
                    ? PageViewActionButton(Icons.arrow_forward_ios_rounded,
                        onTap: () {
                        setState(() {
                          _currentPage = (_pageController.page + 1).toInt();
                        });
                        _pageController
                            .animateToPage(
                          _currentPage,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        )
                            .whenComplete(
                          () {
                            context
                                .read<HomePageProvider>()
                                .changePortfolioPage(_currentPage);
                          },
                        );
                      })
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
