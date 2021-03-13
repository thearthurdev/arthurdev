import 'package:arthurdev/sections/blog_section.dart';
import 'package:arthurdev/sections/intro_section.dart';
import 'package:arthurdev/sections/job_section.dart';
import 'package:arthurdev/sections/portfolio_section.dart';
import 'package:arthurdev/services/blog_rss_feed_service.dart';
import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/my_icons.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/blog_post_listtile.dart';
import 'package:arthurdev/widgets/navigation_bar.dart';
import 'package:arthurdev/widgets/profile.dart';
import 'package:arthurdev/widgets/socials_buttons.dart';
import 'package:arthurdev/widgets/stack_clip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _mainScrollController;
  ScrollController _secondaryScrollController;
  ScrollController _currentScrollController;
  bool _freezeMainScrollController;
  int _currentSection;
  double _initScreenHeight;
  // double _maxMainScrollExtent;
  double _maxSecondaryScrollExtent;
  double _secondaryScrollControllerOffset;
  double _mainScrollControllerExtentBefore;
  double _mainScrollControllerExtentAfter;
  double _secondaryScrollControllerExtentBefore;
  double _currentScrollControllerExtentBefore;

  @override
  void initState() {
    super.initState();
    _mainScrollController = ScrollController()
      ..addListener(_handleScrollEvents);
    _secondaryScrollController = ScrollController()
      ..addListener(_handleScrollEvents);
    _currentScrollController = _mainScrollController;
    _freezeMainScrollController = false;
    _currentSection = 0;
    _secondaryScrollControllerOffset = 0.0;
    _mainScrollControllerExtentBefore = 0.0;
    _mainScrollControllerExtentAfter = 0.0;
    _secondaryScrollControllerExtentBefore = 0.0;
    _currentScrollControllerExtentBefore = 0.0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initScreenHeight = _initScreenHeight ?? kScreenHeight(context) - 128.0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _maxMainScrollExtent = _mainScrollController.position.maxScrollExtent;
      _maxSecondaryScrollExtent =
          _secondaryScrollController.position.maxScrollExtent;

      int sectionIndex = -1;
      for (GlobalKey sectionKey in kSectionKeys) {
        sectionIndex++;
        try {
          final RenderBox sectionRenderBox =
              sectionKey.currentContext.findRenderObject();
          final sectionPosition = sectionRenderBox
              .localToGlobal(Offset(0.0, _secondaryScrollController.offset));
          kSectionScrollOffsets[sectionIndex] =
              sectionPosition.dy - (sectionIndex == 0 ? kToolbarHeight : 0.0);
        } catch (e) {
          print(e);
        }
      }
    });
  }

  void _handleScrollEvents() {
    setState(() {
      _secondaryScrollControllerOffset = _secondaryScrollController.offset;
    });

    _changeCurrentSection();
  }

  void _handleWheelScrollEvents(PointerSignalEvent pointerSignal) {
    _mainScrollControllerExtentBefore =
        _mainScrollController.position.extentBefore;

    _mainScrollControllerExtentAfter =
        _mainScrollController.position.extentAfter;

    _secondaryScrollControllerExtentBefore =
        _secondaryScrollController.position.extentBefore;

    _currentScrollController = _freezeMainScrollController
        ? _secondaryScrollController
        : _mainScrollController;

    _currentScrollControllerExtentBefore = _freezeMainScrollController
        ? _secondaryScrollControllerExtentBefore
        : _mainScrollControllerExtentBefore;

    if (pointerSignal is PointerScrollEvent) {
      double scrollDirection = pointerSignal.scrollDelta.direction;
      double scrollDelta = kToolbarHeight;

      // If user is scrolling down
      if (scrollDirection > 0) {
        // Freeze main scroll controller to hide nav bar
        if (_mainScrollControllerExtentBefore == 0.0 &&
            _freezeMainScrollController == false) {
          setState(() => _freezeMainScrollController = true);
        }

        // Unfreeze main scroll controller to show footer
        if (_secondaryScrollControllerExtentBefore ==
                _maxSecondaryScrollExtent &&
            _freezeMainScrollController == true) {
          setState(() => _freezeMainScrollController = false);
        }

        _currentScrollController.position.moveTo(
          _currentScrollControllerExtentBefore + scrollDelta,
        );
      }

      // If user is scrolling up
      if (scrollDirection < 0) {
        // Unfreeze main scroll controller to show nav bar
        if (_secondaryScrollControllerExtentBefore <= kToolbarHeight &&
            _freezeMainScrollController == true) {
          setState(() => _freezeMainScrollController = false);
        }

        // Freeze main scroll controller when footer is hidden
        if (_mainScrollControllerExtentAfter == kToolbarHeight * 4.0 &&
            _freezeMainScrollController == false) {
          setState(() => _freezeMainScrollController = true);
        }

        _currentScrollController.position.moveTo(
          _currentScrollControllerExtentBefore - scrollDelta,
        );
      }

      _changeCurrentSection();
    }
  }

  void _changeCurrentSection() {
    if (_secondaryScrollControllerOffset <= kSectionScrollOffsets[1])
      setState(() => _currentSection = 0);
    if (_secondaryScrollControllerOffset >= kSectionScrollOffsets[1])
      setState(() => _currentSection = 1);
    if (_secondaryScrollControllerOffset >= kSectionScrollOffsets[2])
      setState(() => _currentSection = 2);
    if (_secondaryScrollControllerOffset >= kSectionScrollOffsets[3])
      setState(() => _currentSection = 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Listener(
          onPointerSignal: (pointerSignal) {
            _handleWheelScrollEvents(pointerSignal);
          },
          child: SingleChildScrollView(
            controller: _mainScrollController,
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                NavigationBar(
                  currentSection: _currentSection,
                  scrollController: _secondaryScrollController,
                ),
                Container(
                  height: kScreenHeight(context),
                  child: Row(
                    children: [
                      LeftSide(
                        _secondaryScrollController,
                        _currentSection,
                        _secondaryScrollControllerOffset,
                      ),
                      RightSide(_secondaryScrollController),
                    ],
                  ),
                ),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide(this.secondaryScrollController, this.currentSection,
      this.secondaryScrollControllerOffset);

  final ScrollController secondaryScrollController;
  final int currentSection;
  final double secondaryScrollControllerOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kScreenHeight(context) + kToolbarHeight,
      width: kScreenWidth(context) * 0.6,
      child: buildSection(context),
    );
  }

  Widget buildSection(BuildContext context) {
    switch (currentSection) {
      case 0:
        return StackClip(
          backgroundWidget: IntroSectionLeft(),
          foregroundWidget: PortfolioSectionLeft(),
          scrollOffset: secondaryScrollControllerOffset -
              (kScreenHeight(context) * currentSection),
        );
      case 1:
        return StackClip(
          backgroundWidget: PortfolioSectionLeft(),
          foregroundWidget: BlogSectionLeft(),
          scrollOffset: secondaryScrollControllerOffset -
              (kScreenHeight(context) * currentSection) -
              (kToolbarHeight * currentSection),
        );
      case 2:
        return StackClip(
          backgroundWidget: BlogSectionLeft(),
          foregroundWidget: JobSectionLeft(),
          scrollOffset: secondaryScrollControllerOffset -
              (kScreenHeight(context) * currentSection) -
              (kToolbarHeight * currentSection),
        );
      case 3:
        return JobSectionLeft();
        break;
      default:
        return SizedBox.shrink();
    }
  }
}

class JobSectionLeft extends StatelessWidget {
  const JobSectionLeft({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColorLight2,
      padding: EdgeInsets.only(bottom: kScreenHeightAwareSize(40.0, context)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Want to do a project together?'
              '\nLet me know here.',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: kSectionHeaderTextStyle,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 420.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobInfoTextField(
                    'What\'s your name?',
                    TextInputType.name,
                  ),
                  JobInfoTextField(
                    'Your fancy email',
                    TextInputType.emailAddress,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: kBorderRadius,
                        child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 4.0, 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Tell me about your project',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: kHeaderTextStyle.copyWith(
                                    fontSize: 18.0,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 24.0),
                              Icon(
                                MyIcons.arrow_right,
                                size: 16.0,
                                color: kAccentColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

class JobInfoTextField extends StatelessWidget {
  JobInfoTextField(this.hint, this.inputType);

  final String hint;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      textCapitalization: TextCapitalization.words,
      cursorColor: kAccentColor,
      keyboardType: inputType,
      style: kHeaderTextStyle.copyWith(
        fontSize: 18.0,
        letterSpacing: 1.0,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: kHeaderTextStyle.copyWith(
          fontSize: 18.0,
          letterSpacing: 1.0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kDividerColor,
            width: 2.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kDividerColor,
            width: 2.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 32.0),
      ),
    );
  }
}

class BlogSectionLeft extends StatelessWidget {
  const BlogSectionLeft({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> blogPosts = {
      'Feb 02': 'Blog post 3',
      'March 03': 'Blog post 2',
      'Dec 12': 'BlogPost 1',
    };

    return Container(
      color: kPrimaryColorLight1,
      padding: EdgeInsets.only(bottom: kScreenHeightAwareSize(40.0, context)),
      // child: FutureBuilder(
      //     future: RssFeedService.loadFeed(),
      //     builder: (context, snapshot) {
      //       RssFeed feed = snapshot.data;

      //       if (snapshot.connectionState != ConnectionState.done) {
      //         return Container(
      //           height: 200.0,
      //           width: 200.0,
      //           child: Center(
      //             child: CircularProgressIndicator(),
      //           ),
      //         );
      //       }

      //       if (snapshot.data == null) {
      //         return Container(
      //           width: 200.0,
      //           height: 200.0,
      //           child: Center(
      //             child: Text(
      //               'Unable to load blog feed',
      //               style: kSectionInfoTextStyle,
      //             ),
      //           ),
      //         );
      //       }

      //       return Flexible(
      //         child: Container(
      //           width: 560.0,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: List.generate(
      //               feed.items.length,
      //               (i) => BlogPostListTile(
      //                 date: feed.items[i].pubDate.toString(),
      //                 title: feed.items[i].title,
      //               ),
      //             ),
      //           ),
      //         ),
      //       );
      //     }),

      child: Center(
        child: Container(
          width: 560.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              blogPosts.length,
              (i) => BlogPostListTile(
                date: blogPosts.keys.elementAt(i),
                title: blogPosts.values.elementAt(i),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PortfolioSectionLeft extends StatelessWidget {
  const PortfolioSectionLeft({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColorLight2,
      child: Center(
        child: Container(
          width: 500.0,
          height: 700.0,
          color: kPrimaryColorDeep,
        ),
      ),
    );
  }
}

class IntroSectionLeft extends StatelessWidget {
  const IntroSectionLeft({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColorLight1,
      padding: EdgeInsets.fromLTRB(
        kScreenWidthAwareSize(80.0, context),
        kScreenHeightAwareSize(80.0, context),
        kScreenWidthAwareSize(80.0, context),
        kScreenHeightAwareSize(120.0, context),
      ),
      child: Profile(),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide(this.secondaryScrollController);

  final ScrollController secondaryScrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: secondaryScrollController,
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        color: kPrimaryColor,
        width: kScreenWidth(context) * 0.4,
        padding: EdgeInsets.symmetric(
            horizontal: kScreenWidthAwareSize(60.0, context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntroSectionRight(),
            PortfolioSectionRight(),
            BlogSectionRight(),
            JobSectionRight(),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 5.0,
      color: kPrimaryColorDeep,
      child: Center(
        child: FittedBox(
          child: Container(
            margin: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 88.0,
                  height: 88.0,
                  child: Image.asset(
                    'assets/images/arthurdev_logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(height: 24.0),
                RichText(
                  text: TextSpan(
                    text: 'Thanks for dropping by,',
                    style: kHeaderTextStyle.copyWith(fontSize: 16.0),
                    children: [
                      TextSpan(
                        text: ' visit again soon!',
                        style: kSectionInfoTextStyle.copyWith(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.0),
                SocialsButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
