import 'package:arthurdev/providers/home_page_provider.dart';
import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/page_view_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    _pageController = PageController(
      initialPage: context.read<HomePageProvider>().currentPortfolioPage,
    );
    _currentPage = 0;

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

class MobWearPortfolioView extends StatefulWidget {
  @override
  _MobWearPortfolioViewState createState() => _MobWearPortfolioViewState();
}

class _MobWearPortfolioViewState extends State<MobWearPortfolioView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                        'Customize Smartphones with colors and textures',
                  ),
                  SizedBox(height: 32.0),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 160.0,
                      child: Image.asset('assets/images/play_store_button.png'),
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

class PlayaPortfolioView extends StatefulWidget {
  @override
  _PlayaPortfolioViewState createState() => _PlayaPortfolioViewState();
}

class _PlayaPortfolioViewState extends State<PlayaPortfolioView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      child: FittedBox(
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
              children: [
                Container(height: kScreenHeight(context) * 0.15),
                Container(
                  height: kScreenHeight(context) * 0.85,
                  width: kScreenWidth(context) * 0.6,
                  child: Image.asset(
                    'assets/images/playa_devices.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SneakPeakPortfolioView extends StatefulWidget {
  @override
  _SneakPeakPortfolioViewState createState() => _SneakPeakPortfolioViewState();
}

class _SneakPeakPortfolioViewState extends State<SneakPeakPortfolioView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      child: Center(
        child: PortfolioInfoBox(
          title: 'More Soon',
          description: 'There\'s more in the works so come back soon!',
        ),
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
  });

  final String image;
  final String title;
  final String description;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 350.0,
      height: 100.0,
      padding: EdgeInsets.only(right: 48.0),
      child: Row(
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
                FittedBox(
                  child: Text(title, style: kLargeHeaderTextStyle),
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
    );
  }
}
