import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/portfolio_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobWearPortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context) || kIsTablet(context)
        ? buildDesktopView(context)
        : buildMobileView(context);
  }

  Widget buildDesktopView(BuildContext context) {
    return Container(
      color: kPrimaryColorLight2(context),
      child: Stack(
        children: [
          Positioned(
            top: -kScreenHeight(context) * 0.2,
            right: -300.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.phone_android_rounded,
                color: kPrimaryTextColorDark(context),
                size: 800.0,
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
                Flexible(
                  child: Image.asset(kImageAssets['MobWearDevice']),
                ),
                Flexible(
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PortfolioInfoWidget(
                          image: kImageAssets['MobWearLogo'],
                          title: 'MobWear',
                          description:
                              'Customize smartphones with colors and textures',
                          toolTip: 'Click to view the code on GitHub',
                          onTap: () async {
                            Uri url = kMobWearGitHubURL;

                            if (!await launchUrl(url)) {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                        InkWell(
                          onTap: () async {
                            Uri url = kMobWearPlayStoreURL;

                            if (!await launchUrl(url)) {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Container(
                            width: 160.0,
                            margin: EdgeInsets.only(right: 60.0, top: 32.0),
                            child: Image.asset(
                              kImageAssets['PlayStoreButton'],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
            top: -kScreenHeight(context) * 0.1,
            right: -160.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.phone_android_rounded,
                color: kPrimaryTextColorLight(context),
                size: 400.0,
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            left: kScreenWidthAwareSize(140.0, context),
            right: kScreenWidthAwareSize(60.0, context),
            child: Column(
              children: [
                Container(
                  width: kScreenWidthAwareSize(500.0, context),
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PortfolioInfoWidget(
                          image: kImageAssets['MobWearLogo'],
                          title: 'MobWear',
                          description:
                              'Customize smartphones with colors and textures',
                          toolTip: 'Click to view the code on GitHub',
                          onTap: () async {
                            Uri url = kMobWearGitHubURL;

                            if (!await launchUrl(url)) {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                        InkWell(
                          onTap: () async {
                            Uri url = kMobWearPlayStoreURL;

                            if (!await launchUrl(url)) {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Container(
                            width: 160.0,
                            margin: EdgeInsets.only(right: 60.0, top: 32.0),
                            child: Image.asset(
                              kImageAssets['PlayStoreButton'],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: kScreenWidthAwareSize(500.0, context),
                  child: Image.asset(
                    kImageAssets['MobWearDevice'],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
