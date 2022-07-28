import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/portfolio_info_widget.dart';
import 'package:flutter/material.dart';

class MoreSoonPortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context)
        ? buildDesktopView(context)
        : buildMobileView(context);
  }

  Widget buildDesktopView(BuildContext context) {
    return Container(
      color: kPrimaryColorLight1(context),
      child: Stack(
        children: [
          Positioned(
            bottom: -kScreenHeight(context) * 0.3,
            right: -200.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.library_add_rounded,
                color: kPrimaryTextColorLight(context),
                size: 800.0,
              ),
            ),
          ),
          Center(
            child: PortfolioInfoWidget(
              title: 'More Soon...',
              description:
                  'There\'s a lot in the works so stay on\nthe lookout',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMobileView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColorLight1(context),
            kPrimaryColorLight2(context),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 80.0,
            right: -100.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.library_add_rounded,
                color: kPrimaryTextColorLight(context),
                size: 400.0,
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              width: kScreenWidth(context),
              height: kScreenHeight(context) * 0.6,
              child: Center(
                child: Container(
                  width: 260.0,
                  margin: EdgeInsets.only(left: 60.0),
                  child: FittedBox(
                    child: PortfolioInfoWidget(
                      title: 'More Soon...',
                      description:
                          'There\'s a lot in the works so stay on\nthe lookout',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
