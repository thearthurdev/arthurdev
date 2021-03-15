import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/info_action_box.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSectionRight extends StatelessWidget {
  // const PortfolioSection({
  //   Key key,
  //   @required this.initScreenHeight,
  // }) : super(key: key);

  // final double initScreenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: kPortfolioSectionKey,
      // color: Colors.red,
      height: kScreenHeight(context) + kToolbarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoActionBox(
            sectionTitle: 'Portfolio',
            heading: 'Creative works,\nhighlighted projects',
            body: 'Check out some of my projects and\ncreative works',
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
    );
  }
}

  //   return Container(
  //     key: kPortfolioSectionKey,
  //     width: double.infinity,
  //     color: kPrimaryColor,
  //     child: Align(
  //       alignment: Alignment.topCenter,
  //       child: Container(
  //         constraints: BoxConstraints(maxWidth: kMaxWidth),
  //         child: kIsDesktop(context) ? desktopLayout() : tabletLayout(),
  //       ),
  //     ),
  //   );
  // }

  // Widget desktopLayout() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 64.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             SizedBox(height: initScreenHeight * 0.16),
  //             portfolioInfoActionBox(),
  //             SizedBox(height: 64.0),
  //             projectPlaceholder(),
  //             SizedBox(height: 64.0),
  //             projectPlaceholder(),
  //             SizedBox(height: 64.0),
  //           ],
  //         ),
  //         Column(
  //           children: [
  //             SizedBox(height: initScreenHeight * 0.08),
  //             Container(
  //               margin: EdgeInsets.only(top: 80.0, left: 16.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   projectPlaceholder(),
  //                   SizedBox(height: 64.0),
  //                   projectPlaceholder(),
  //                   SizedBox(height: 64.0),
  //                   projectPlaceholder(),
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

  // Widget tabletLayout() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 24.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(height: 64.0),
  //         portfolioInfoActionBox(),
  //         SizedBox(height: 64.0),
  //         FittedBox(
  //           child: Row(
  //             children: [
  //               TechnologyButton(
  //                 icon: CustomIcons.ic_flutter,
  //                 title: 'Flutter\nSDK & Dart',
  //                 subtitle: '4 Projects',
  //                 isSelected: true,
  //               ),
  //               SizedBox(height: 80.0),
  //               TechnologyButton(
  //                 icon: CustomIcons.ic_kotlin,
  //                 iconSize: 20.0,
  //                 title: 'Android\nSDK & Kotlin',
  //                 subtitle: '2 Projects',
  //               ),
  //               SizedBox(height: 80.0),
  //               TechnologyButton(
  //                 icon: CustomIcons.ic_settings,
  //                 title: 'Tasker,\nGCP, etc.',
  //                 subtitle: '6 Projects',
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(height: 64.0),
  //         projectPlaceholder(),
  //         SizedBox(height: 64.0),
  //       ],
  //     ),
  //   );
  // }

  // Widget portfolioInfoActionBox() {
  //   return InfoActionBox(
  //     sectionTitle: 'Portfolio',
  //     heading: 'Creative works,\nselected projects.',
  //     body: 'Check out some of my side projects and'
  //         '\ncreative works.',
  //     actionText: 'Explore more',
  //     leftIndent: 16.0,
  //     onActionTap: () async {
  //       String url = kPortfolioURL;
  //       if (await canLaunch(url)) {
  //         await launch(url);
  //       } else {
  //         throw 'Could not launch $url';
  //       }
  //     },
  //   );
  // }

  // Widget projectPlaceholder() {
  //   return Container(
  //     width: 396.0,
  //     height: 424.0,
  //     color: Color(0xFF252734),
  //     margin: const EdgeInsets.only(left: 16.0),
  //   );
  // }

