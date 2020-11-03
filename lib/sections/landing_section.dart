import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/arthurdev_banner.dart';
import 'package:arthurdev/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:arthurdev/widgets/profile.dart';
import 'package:arthurdev/widgets/info_action_box.dart';
import 'package:arthurdev/widgets/socials_buttons.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({
    Key key,
    @required this.initScreenHeight,
    @required this.currentSection,
    @required this.scrollController,
  }) : super(key: key);

  final double initScreenHeight;
  final int currentSection;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: kMaxWidth),
      child: kIsDesktop(context)
          ? desktopLayout(context)
          : kIsTablet(context)
              ? tabletLayout(context)
              : mobileLayout(context),
    );
  }

  Widget desktopLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: initScreenHeight * 0.08),
              ArthurDevBanner(isLarge: true),
              SizedBox(height: initScreenHeight * 0.15),
              Profile(),
              SizedBox(height: 16.0),
              SocialsButtons(),
              SizedBox(height: initScreenHeight * 0.3),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: initScreenHeight * 0.1),
              NavigationBar(currentSection: currentSection, scrollController: scrollController,),
              SizedBox(height: initScreenHeight * 0.3),
              introductionInfoActionBox(leftIndent: 16.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget tabletLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: initScreenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArthurDevBanner(isLarge: true),
                  InkWell(
                    onTap: () {},
                    customBorder: CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.menu_rounded,
                        size: 32.0,
                        color: kPrimaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: initScreenHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Profile(),
                  SizedBox(height: 24.0),
                  SocialsButtons(),
                  SizedBox(height: 64.0),
                  introductionInfoActionBox(),
                  SizedBox(height: 64.0),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget mobileLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: initScreenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArthurDevBanner(isLarge: true),
                  InkWell(
                    onTap: () {},
                    customBorder: CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.menu_rounded,
                        size: 32.0,
                        color: kPrimaryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: initScreenHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Profile(),
                  SizedBox(height: 24.0),
                  SocialsButtons(),
                  SizedBox(height: 64.0),
                  introductionInfoActionBox(),
                  SizedBox(height: 64.0),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget introductionInfoActionBox({double leftIndent}) {
    return InfoActionBox(
      sectionTitle: 'Introduction',
      heading: 'Software Developer,\nbased in Ghana.',
      body:
          'I specialize in cross-platform mobile\ndevelopment, android and windows\nautomation.',
      actionText: 'More about me',
      leftIndent: leftIndent,
    );
  }
}
