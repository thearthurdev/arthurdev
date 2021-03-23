import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/info_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: kIsDesktop(context) ? kBlogSectionKey : null,
      height:
          kIsDesktop(context) ? kScreenHeight(context) + kToolbarHeight : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoActionWidget(
            sectionTitle: 'Blog',
            heading: 'What\'s new?\nSee my latest blog posts',
            body: 'I write about tech tips, software development,'
                '\nmy experiences and opinions now and then',
            actionText: 'Visit blog',
            onActionTap: () async {
              String url = kBlogURL;
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
