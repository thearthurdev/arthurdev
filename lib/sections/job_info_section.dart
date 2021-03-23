import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/info_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: kIsDesktop(context) ? kJobSectionKey : null,
      height:
          kIsDesktop(context) ? kScreenHeight(context) + kToolbarHeight : null,
      padding: kIsDesktop(context)
          ? null
          : EdgeInsets.symmetric(
              horizontal: kScreenWidthAwareSize(160.0, context),
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoActionWidget(
            sectionTitle: 'Job',
            heading: 'Impressed?\nGive me a job',
            body: 'I am looking for a part-time job\nor a freelance project',
            actionText: 'Email me',
            onActionTap: () async {
              String url = '$kEmailURL?subject=Job Offer';
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
