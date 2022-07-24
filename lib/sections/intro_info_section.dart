import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/material.dart';
import 'package:arthurdev/widgets/info_action_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: kIsDesktop(context) ? kIntroSectionKey : null,
      height: kIsDesktop(context) ? kScreenHeight(context) : null,
      padding: kIsDesktop(context)
          ? EdgeInsets.symmetric(
              horizontal: kScreenWidthAwareSize(40.0, context),
            )
          : EdgeInsets.symmetric(
              horizontal: kScreenWidthAwareSize(140.0, context),
            ),
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InfoActionWidget(
              sectionTitle: 'Intro',
              heading: 'Software Developer,\nbased in Ghana',
              body:
                  'I specialize in cross-platform mobile\ndevelopment, UI design, Android\nand Windows automation',
              actionText: 'More about me',
              onActionTap: () async {
                Uri url = kResumeURL;

                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
