import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/portfolio_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayaPortfolioView extends StatelessWidget {
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
            top: -kScreenHeight(context) * 0.2,
            left: -160.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.play_circle_outline_rounded,
                color: kPrimaryTextColorLight(context),
                size: 800.0,
              ),
            ),
          ),
          Positioned(
            top: 90.0,
            left: 120.0,
            child: PortfolioInfoWidget(
              title: 'Playa',
              description: 'For music that looks as\ngood as it sounds',
              toolTip:
                  'Click to see the mockup in its full\ntwitter-compression glory',
              onTap: () async {
                Uri url = kPlayaTwitterURL;

                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
            ),
          ),
          Positioned(
            bottom: kScreenHeightAwareSize(40.0, context),
            left: kScreenWidthAwareSize(-150.0, context),
            child: FittedBox(
              child: Container(
                width: kScreenWidthAwareSize(650.0, context),
                height: kScreenHeightAwareSize(520.0, context),
                child: Image.asset(
                  kImageAssets['PlayaDeviceLaptop'],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned(
            top: kScreenHeightAwareSize(200.0, context),
            left: kScreenWidthAwareSize(200.0, context),
            child: FittedBox(
              child: Container(
                width: kScreenWidthAwareSize(180.0, context),
                height: kScreenHeightAwareSize(280.0, context),
                child: Image.asset(
                  kImageAssets['PlayaDevicePhone'],
                  fit: BoxFit.fitHeight,
                ),
              ),
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
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColorLight2(context),
            kPrimaryColorLight1(context),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -kScreenHeight(context) * 0.4,
            left: -160.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.play_circle_outline_rounded,
                color: kPrimaryTextColorLight(context),
                size: 800.0,
              ),
            ),
          ),
          Positioned(
            top: 32.0,
            left: 32.0,
            child: PortfolioInfoWidget(
              title: 'Playa',
              description: 'For music that looks as\ngood as it sounds',
              toolTip:
                  'Click to see the mockup in its full\ntwitter-compression glory',
              onTap: () async {
                Uri url = kPlayaTwitterURL;

                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
            ),
          ),
          Positioned(
            top: kScreenHeightAwareSize(120.0, context),
            left: kScreenWidthAwareSize(-140.0, context),
            right: kScreenWidthAwareSize(-220.0, context),
            child: FittedBox(
              child: Container(
                width: 600.0,
                child: Image.asset(
                  kImageAssets['PlayaDeviceLaptop'],
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
