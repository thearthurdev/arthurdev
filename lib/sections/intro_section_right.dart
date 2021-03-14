import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/material.dart';
import 'package:arthurdev/widgets/info_action_box.dart';

class IntroSectionRight extends StatelessWidget {
  // const IntroSection({
  //   Key key,
  //   @required this.initScreenHeight,
  //   @required this.currentSection,
  //   @required this.scrollController,
  // }) : super(key: key);

  // final double initScreenHeight;
  // final int currentSection;
  // final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: kIntroSectionKey,
      // color: Colors.green,
      height: kScreenHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoActionBox(
            sectionTitle: 'Intro',
            heading: 'Software Developer,\nbased in Ghana.',
            body:
                'I specialize in cross-platform mobile\ndevelopment, android and windows\nautomation.',
            actionText: 'More about me',
          ),
        ],
      ),
    );
  }
}
  //   return Container(
  //     key: kIntroSectionKey,
  //     width: double.infinity,
  //     child: Align(
  //       alignment: Alignment.topCenter,
  //       child: Container(
  //         constraints: BoxConstraints(maxWidth: kMaxWidth),
  //         child: kIsDesktop(context)
  //             ? desktopLayout(context)
  //             : kIsTablet(context)
  //                 ? tabletLayout(context)
  //                 : mobileLayout(context),
  //       ),
  //     ),
  //   );
  // }

  // Widget desktopLayout(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 64.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Flexible(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               SizedBox(height: initScreenHeight * 0.11),
  //               ArthurDevBanner(
  //                 scrollController: scrollController,
  //                 isLarge: true,
  //               ),
  //               SizedBox(height: initScreenHeight * 0.17),
  //               Profile(),
  //               SizedBox(height: initScreenHeight * 0.32),
  //             ],
  //           ),
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             SizedBox(height: initScreenHeight * 0.1),
  //             NavigationBar(
  //               scrollController: scrollController,
  //               currentSection: currentSection,
  //             ),
  //             SizedBox(height: initScreenHeight * 0.24),
  //             introductionInfoActionBox(leftIndent: 16.0),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget tabletLayout(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 32.0),
  //     child: Column(
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             SizedBox(height: initScreenHeight * 0.02),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 ArthurDevBanner(
  //                   scrollController: scrollController,
  //                   isLarge: true,
  //                 ),
  //                 NavigationMenu(
  //                   currentSection: currentSection,
  //                   scrollController: scrollController,
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: initScreenHeight * 0.02),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Profile(),
  //                 SizedBox(height: 80.0),
  //                 introductionInfoActionBox(),
  //                 SizedBox(height: 64.0),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget mobileLayout(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 32.0),
  //     child: Column(
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             SizedBox(height: initScreenHeight * 0.02),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 ArthurDevBanner(
  //                   scrollController: scrollController,
  //                   isLarge: true,
  //                 ),
  //                 NavigationMenu(
  //                   currentSection: currentSection,
  //                   scrollController: scrollController,
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: initScreenHeight * 0.02),
  //             Container(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Profile(),
  //                   SizedBox(height: 80.0),
  //                   introductionInfoActionBox(),
  //                   SizedBox(height: 64.0),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget introductionInfoActionBox({double leftIndent}) {
  //   return InfoActionBox(
  //     sectionTitle: 'Introduction',
  //     heading: 'Software Developer,\nbased in Ghana.',
  //     body:
  //         'I specialize in cross-platform mobile\ndevelopment, android and windows\nautomation.',
  //     actionText: 'More about me',
  //     leftIndent: leftIndent,
  //   );
  // }

