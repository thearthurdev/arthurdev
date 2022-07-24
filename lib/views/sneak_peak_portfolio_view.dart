import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/portfolio_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SneakPeakPortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context)
        ? buildDesktopView(context)
        : buildMobileView(context);
  }

  Widget buildDesktopView(BuildContext context) {
    return Container(
      color: kPrimaryColorLight2,
      child: Stack(
        children: [
          Positioned(
            bottom: kScreenHeight(context) * 0.1,
            left: -140.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.shopping_cart_outlined,
                color: kPrimaryColorDark,
                size: 600.0,
              ),
            ),
          ),
          Container(
            height: kScreenHeight(context),
            padding: EdgeInsets.symmetric(
              vertical: kScreenHeightAwareSize(60.0, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 32.0),
                Flexible(
                  child: FittedBox(
                    child: PortfolioInfoWidget(
                      title: 'Sneak Peak',
                      description:
                          'Experience delightful animations\nwhile sneaker shopping',
                      toolTip: 'Click to see the animations in action',
                      onTap: () async {
                        Uri url = kSneakPeakTwitterURL;

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launchUrl $url';
                        }
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: Image.asset(kImageAssets['SneakPeakDevice']),
                ),
              ],
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
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColorLight1,
            kPrimaryColorLight2,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -kScreenHeight(context) * 0.03,
            right: -120.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.shopping_cart_outlined,
                color: kPrimaryColorDark,
                size: 350.0,
              ),
            ),
          ),
          Positioned(
            left: kScreenWidthAwareSize(-80.0, context),
            right: kScreenWidthAwareSize(280.0, context),
            child: FittedBox(
              child: Container(
                height: 200.0,
                child: Image.asset(kImageAssets['SneakPeakDevice']),
              ),
            ),
          ),
          Positioned(
            top: kScreenHeightAwareSize(180.0, context),
            bottom: kScreenHeightAwareSize(-60.0, context),
            right: kScreenWidthAwareSize(-10.0, context),
            child: Container(
              width: kScreenWidthAwareSize(340.0, context),
              child: FittedBox(
                child: PortfolioInfoWidget(
                  title: 'Sneak Peak',
                  description:
                      'Experience delightful animations\nwhile sneaker shopping',
                  toolTip: 'Click to see the animations in action',
                  onTap: () async {
                    Uri url = kSneakPeakTwitterURL;

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launchUrl $url';
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
