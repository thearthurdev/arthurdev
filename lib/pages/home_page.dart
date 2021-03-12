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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController;
  bool showAppBar;
  int currentSection;
  double initScreenHeight;
  double screenHeight;
  double maxScrollExtent;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(handleScrolling);
    showAppBar = false;
    currentSection = 0;
    RssFeedService.loadFeed();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initScreenHeight = initScreenHeight ?? kScreenHeight(context) - 128.0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenHeight = kScreenHeight(context);
      maxScrollExtent = scrollController.position.maxScrollExtent;

      int sectionIndex = -1;
      for (GlobalKey sectionKey in kSectionKeys) {
        sectionIndex++;
        try {
          final RenderBox sectionRenderBox =
              sectionKey.currentContext.findRenderObject();
          final sectionPosition = sectionRenderBox
              .localToGlobal(Offset(0.0, scrollController.offset));
          kSectionScrollOffsets[sectionIndex] = sectionPosition.dy -
              (sectionIndex == 1 && kIsDesktop(context) ? 176.0 : 0.0);
        } catch (e) {
          print(e);
        }
      }
    });
  }

  void handleScrolling() {
    if (scrollController.offset > 64.0 && showAppBar == false) {
      setState(() => showAppBar = true);
    } else if (scrollController.offset <= 100.0 && showAppBar == true) {
      setState(() => showAppBar = false);
    }

    if (scrollController.offset <= kSectionScrollOffsets[0])
      setState(() => currentSection = 0);
    if (scrollController.offset >= kSectionScrollOffsets[1])
      setState(() => currentSection = 1);
    if (scrollController.offset >= kSectionScrollOffsets[2])
      setState(() => currentSection = 2);
    if (scrollController.offset >= kSectionScrollOffsets[3])
      setState(() => currentSection = 3);
  }

  void handleWheelScrollEvents(PointerSignalEvent pointerSignal) {
    final double scrollExtentBefore = scrollController.position.extentBefore;

    if (pointerSignal is PointerScrollEvent) {
      double scrollDirection = pointerSignal.scrollDelta.direction;
      double scrollDelta = screenHeight * 0.05;

      if (scrollDirection > 0) {
        scrollController.position.animateTo(
          scrollExtentBefore + (scrollDelta * (maxScrollExtent / screenHeight)),
          duration: Duration(milliseconds: 300),
          curve: Curves.decelerate,
        );
      } else {
        scrollController.position.animateTo(
          scrollExtentBefore - (scrollDelta * (maxScrollExtent / screenHeight)),
          duration: Duration(milliseconds: 300),
          curve: Curves.decelerate,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: kHomePageKey,
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Listener(
                      onPointerSignal: (pointerSignal) =>
                          handleWheelScrollEvents(pointerSignal),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            IntroSection(
                              initScreenHeight: initScreenHeight,
                              currentSection: currentSection,
                              scrollController: scrollController,
                            ),
                            ExperienceSection(
                              initScreenHeight: initScreenHeight,
                            ),
                            TechnologiesSection(
                              initScreenHeight: initScreenHeight,
                            ),
                            PortfolioSection(
                              initScreenHeight: initScreenHeight,
                            ),
                            BlogSection(
                              initScreenHeight: initScreenHeight,
                            ),
                            JobSection(
                              initScreenHeight: initScreenHeight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomAppBar(
              showAppBar: showAppBar,
              currentSection: currentSection,
              scrollController: scrollController,
            ),
            CustomScrollbar(scrollController: scrollController),
          ],
        ),
      ),
    );
  }
}
