import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/info_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: kIsDesktop(context) ? kPortfolioSectionKey : null,
      height:
          kIsDesktop(context) ? kScreenHeight(context) + kToolbarHeight : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoActionWidget(
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
