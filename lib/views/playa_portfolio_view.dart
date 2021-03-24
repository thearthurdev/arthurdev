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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColorLight2,
            kPrimaryColorLight1,
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
                color: kPrimaryColorDark,
                size: 800.0,
              ),
            ),
          ),
          Positioned(
            top: 32.0,
            left: 62.0,
            child: PortfolioInfoWidget(
                title: 'Playa',
                description: 'For music that looks as\ngood as it sounds',
                toolTip:
                    'Click to see the mockup in its full\ntwitter-compression glory',
                onTap: () async {
                  String url = kPlayaTwitterURL;

                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
          ),
          Positioned(
            top: kScreenHeightAwareSize(200.0, context),
            left: kScreenWidthAwareSize(188.0, context),
            child: FittedBox(
              child: Container(
                width: kScreenWidthAwareSize(250.0, context),
                height: kScreenHeightAwareSize(350.0, context),
                child: Image.asset(
                  kImageAssets['PlayaDevicePhone'],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: kScreenHeightAwareSize(-20.0, context),
            left: kScreenWidthAwareSize(-200.0, context),
            child: FittedBox(
              child: Container(
                width: kScreenWidthAwareSize(750.0, context),
                height: kScreenHeightAwareSize(550.0, context),
                child: Image.asset(
                  kImageAssets['PlayaDeviceLaptop'],
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
            kPrimaryColorLight2,
            kPrimaryColorLight1,
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
                color: kPrimaryColorDark,
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
                  String url = kPlayaTwitterURL;

                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
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
