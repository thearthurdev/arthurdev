import 'package:arthurdev/providers/home_page_provider.dart';
import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/page_view_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSectionLeft extends StatefulWidget {
  const PortfolioSectionLeft({Key key}) : super(key: key);

  @override
  _PortfolioSectionLeftState createState() => _PortfolioSectionLeftState();
}

class _PortfolioSectionLeftState extends State<PortfolioSectionLeft> {
  PageController _pageController;
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = context.read<HomePageProvider>().currentPortfolioPage;
    _pageController = PageController(initialPage: _currentPage);

    _loadImageAssets(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _precacheImageAssets(context);
  }

  static List<String> _portfolioImageAssets = [
    'assets/images/mobwear_device.png',
    'assets/images/playa_devices.png',
    'assets/images/sneak_peak_device.png',
  ];

  static List<Image> imageAssets = [];

  static void _loadImageAssets(BuildContext context) {
    imageAssets.clear();
    for (String asset in _portfolioImageAssets) {
      imageAssets.add(Image.asset(asset));
    }
  }

  static Future<void> _precacheImageAssets(BuildContext context) async {
    for (Image asset in imageAssets) {
      await precacheImage(asset.image, context);
    }
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
            physics: NeverScrollableScrollPhysics(),
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

class MobWearPortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColorLight1,
            kPrimaryColorLight2,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Image.asset('assets/images/mobwear_device.png'),
          ),
          Flexible(
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PortfolioInfoBox(
                    image: 'assets/images/mobwear_logo.png',
                    title: 'MobWear',
                    description:
                        'Customize smartphones with colors and textures',
                    toolTip: 'Click to view the code on GitHub',
                    onTap: () async {
                      String url = kMobWearGitHubURL;

                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      String url = kMobWearPlayStoreURL;

                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      width: 160.0,
                      margin: EdgeInsets.only(right: 60.0, top: 32.0),
                      child: Image.asset(
                        'assets/images/play_store_button.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayaPortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            top: 48.0,
            left: 48.0,
            child: PortfolioInfoBox(
              title: 'Playa',
              description: 'For music that looks as\ngood as it sounds',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Container()),
              Container(
                child: Image.asset(
                  'assets/images/playa_devices.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SneakPeakPortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 32.0),
          Flexible(
            child: FittedBox(
              child: PortfolioInfoBox(
                title: 'Sneak Peak',
                description:
                    'Experience delightful animations\nwhile sneaker shopping',
                toolTip: 'Click to see the animations in action',
                onTap: () async {
                  String url = kSneakPeakTwitterURL;

                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ),
          ),
          Flexible(
            child: Image.asset('assets/images/sneak_peak_device.png'),
          ),
        ],
      ),
    );
  }
}

class MoreSoonPortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColorLight1,
            kPrimaryColorLight2,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -kScreenHeight(context) * 0.3,
            right: -200.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.library_add_rounded,
                color: kPrimaryColorDark,
                size: 800.0,
              ),
            ),
          ),
          Center(
            child: PortfolioInfoBox(
              title: 'More Soon...',
              description: 'There\'s a lot in the works so stay on\nthe lookout',
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioInfoBox extends StatelessWidget {
  const PortfolioInfoBox({
    @required this.title,
    this.description,
    this.image,
    this.width,
    this.onTap,
    this.toolTip,
  });

  final String image;
  final String title;
  final String description;
  final String toolTip;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (toolTip == null) return buildView();

    return Tooltip(
      message: toolTip,
      waitDuration: kMediumDuration,
      decoration: BoxDecoration(
        color: kPrimaryColorDark,
        borderRadius: kBorderRadius,
      ),
      textStyle: kSectionInfoTextStyle.copyWith(
        fontSize: 12.0,
        color: kPrimaryTextColorLight,
      ),
      padding: EdgeInsets.all(8.0),
      preferBelow: true,
      verticalOffset: 32.0,
      child: buildView(),
    );
  }

  InkWell buildView() {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: width ?? 350.0),
        height: 100.0,
        margin: EdgeInsets.only(right: 48.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            image != null
                ? Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            image != null ? SizedBox(width: 8.0) : SizedBox.shrink(),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Text(title, style: kLargeHeaderTextStyle),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Flexible(
                    child: Text(description, style: kSectionInfoTextStyle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
