import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/material.dart';
import 'package:arthurdev/widgets/info_action_box.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: kIntroSectionKey,
      height: kScreenHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoActionBox(
            sectionTitle: 'Intro',
            heading: 'Software Developer,\nbased in Ghana',
            body:
                'I specialize in cross-platform mobile\ndevelopment, android and windows\nautomation',
            actionText: 'More about me',
            onActionTap: () async {
              String url = kLinkedInURL;

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
