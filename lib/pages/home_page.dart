import 'package:arthurdev/sections/blog_section.dart';
import 'package:arthurdev/sections/experience_section.dart';
import 'package:arthurdev/sections/job_section.dart';
import 'package:arthurdev/sections/landing_section.dart';
import 'package:arthurdev/sections/projects_section.dart';
import 'package:arthurdev/sections/technologies_section.dart';
import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/custom_app_bar.dart';
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

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(handleScrolling);
    showAppBar = false;
    currentSection = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initScreenHeight = kScreenHeight(context) - 128.0;
  }

  void handleScrolling() {
    if (scrollController.offset > 64.0 && showAppBar == false) {
      setState(() => showAppBar = true);
    } else if (scrollController.offset <= 100.0 && showAppBar == true) {
      setState(() => showAppBar = false);
    }

    if (scrollController.offset <= kWorksSectionScrollOffset)
      setState(() => currentSection = 0);
    if (scrollController.offset >= kWorksSectionScrollOffset)
      setState(() => currentSection = 1);
    if (scrollController.offset >= kBlogSectionScrollOffset)
      setState(() => currentSection = 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      child: Column(
                        children: [
                          LandingSection(
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
                          ProjectsSection(
                            initScreenHeight: initScreenHeight,
                          ),
                          BlogSection(
                            initScreenHeight: initScreenHeight,
                          ),
                          // JobSection(
                          //   initScreenHeight: initScreenHeight,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            CustomAppBar(
              showAppBar: showAppBar,
              currentSection: currentSection,
              scrollController: scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
