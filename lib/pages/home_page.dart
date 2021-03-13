import 'package:arthurdev/sections/blog_section.dart';
import 'package:arthurdev/sections/experience_section.dart';
import 'package:arthurdev/sections/job_section.dart';
import 'package:arthurdev/sections/intro_section.dart';
import 'package:arthurdev/sections/portfolio_section.dart';
import 'package:arthurdev/sections/technologies_section.dart';
import 'package:arthurdev/services/blog_rss_feed_service.dart';
import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/custom_app_bar.dart';
import 'package:arthurdev/widgets/custom_scrollbar.dart';
import 'package:arthurdev/widgets/info_action_box.dart';
import 'package:arthurdev/widgets/navigation_bar.dart';
import 'package:arthurdev/widgets/socials_buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/media/media.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController mainScrollController;
  ScrollController secondaryScrollController;
  int currentSection;
  double initScreenHeight;
  double screenHeight;
  double maxMainScrollExtent;
  double maxSecondaryScrollExtent;
  bool freezeMainScrollController;

  @override
  void initState() {
    super.initState();
    mainScrollController = ScrollController();
    secondaryScrollController = ScrollController();
    freezeMainScrollController = false;
    currentSection = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initScreenHeight = initScreenHeight ?? kScreenHeight(context) - 128.0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenHeight = kScreenHeight(context);
      maxMainScrollExtent = mainScrollController.position.maxScrollExtent;
      maxSecondaryScrollExtent =
          secondaryScrollController.position.maxScrollExtent;

      // int sectionIndex = -1;
      // for (GlobalKey sectionKey in kSectionKeys) {
      //   sectionIndex++;
      //   try {
      //     final RenderBox sectionRenderBox =
      //         sectionKey.currentContext.findRenderObject();
      //     final sectionPosition = sectionRenderBox
      //         .localToGlobal(Offset(0.0, mainScrollController.offset));
      //     kSectionScrollOffsets[sectionIndex] = sectionPosition.dy -
      //         (sectionIndex == 1 && kIsDesktop(context) ? 176.0 : 0.0);
      //   } catch (e) {
      //     print(e);
      //   }
      // }
    });
  }

  void handleWheelScrollEvents(PointerSignalEvent pointerSignal) {
    ScrollController currentScrollController = freezeMainScrollController
        ? secondaryScrollController
        : mainScrollController;

    final double mainScrollExtentBefore =
        mainScrollController.position.extentBefore;

    final double mainScrollExtentAfter =
        mainScrollController.position.extentAfter;

    final double secondaryScrollExtentBefore =
        secondaryScrollController.position.extentBefore;

    double currentScrollExtentBefore = freezeMainScrollController
        ? secondaryScrollExtentBefore
        : mainScrollExtentBefore;

    if (pointerSignal is PointerScrollEvent) {
      double scrollDirection = pointerSignal.scrollDelta.direction;

      double scrollDelta = kToolbarHeight;

      if (scrollDirection > 0) {
        if (mainScrollExtentBefore == 0.0 &&
            freezeMainScrollController == false) {
          setState(() => freezeMainScrollController = true);
        }

        if (secondaryScrollExtentBefore == maxSecondaryScrollExtent &&
            freezeMainScrollController == true) {
          setState(() => freezeMainScrollController = false);
        }

        currentScrollController.position.moveTo(
          currentScrollExtentBefore + scrollDelta,
        );
      } else {
        if (secondaryScrollExtentBefore <= kToolbarHeight &&
            freezeMainScrollController == true) {
          setState(() => freezeMainScrollController = false);
        }

        if (mainScrollExtentAfter == kToolbarHeight * 4.0 &&
            freezeMainScrollController == false) {
          setState(() => freezeMainScrollController = true);
        }

        currentScrollController.position.moveTo(
          currentScrollExtentBefore - scrollDelta,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: kHomePageKey,
      // backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Listener(
          onPointerSignal: (pointerSignal) =>
              handleWheelScrollEvents(pointerSignal),
          child: SingleChildScrollView(
            controller: mainScrollController,
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                NavigationBar(
                  currentSection: currentSection,
                  scrollController: mainScrollController,
                ),
                Container(
                  height: kScreenHeight(context),
                  child: Row(
                    children: [
                      LeftSide(
                        initScreenHeight,
                        secondaryScrollController,
                      ),
                      RightSide(initScreenHeight),
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
  const LeftSide(this.initScreenHeight, this.secondaryScrollController);

  final double initScreenHeight;
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
            Container(
              // color: Colors.green,
              height: kScreenHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoActionBox(
                    sectionTitle: 'Introduction',
                    heading: 'Software Developer,\nbased in Ghana.',
                    body:
                        'I specialize in cross-platform mobile\ndevelopment, android and windows\nautomation.',
                    actionText: 'More about me',
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.red,
              height: kScreenHeight(context) + kToolbarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoActionBox(
                    sectionTitle: 'Portfolio',
                    heading: 'Creative works,\nselected projects.',
                    body: 'Check out some of my side projects and'
                        '\ncreative works.',
                    actionText: 'Explore more',
                    onActionTap: () async {
                      String url = kPortfolioURL;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.blue,
              height: kScreenHeight(context) + kToolbarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoActionBox(
                    sectionTitle: 'Blog',
                    heading: 'What\'s new?\nSee my latest blog posts.',
                    body: 'I write about tech tips and tricks,'
                        '\nmy experiences and opinions now and then.',
                    actionText: 'Visit blog',
                    onActionTap: () async {
                      String url = kBlogURL;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.pink,
              height: kScreenHeight(context) + kToolbarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoActionBox(
                    sectionTitle: 'Job',
                    heading: 'Impressed?\nGive me a job.',
                    body:
                        'I am looking for a part-time job or a\nfreelance project.',
                    actionText: 'arthurdelords@gmail.com',
                    onActionTap: () async {
                      String url = kEmailURL;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
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

class RightSide extends StatelessWidget {
  const RightSide(this.initScreenHeight);

  final double initScreenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        // width: kScreenWidth(context) * 0.4,
        child: SizedBox());
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
