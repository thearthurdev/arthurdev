import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/info_action_box.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: kJobSectionKey,
      height: kScreenHeight(context) + kToolbarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoActionBox(
            sectionTitle: 'Job',
            heading: 'Impressed?\nGive me a job',
            body: 'I am looking for a part-time job or a\nfreelance project',
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
