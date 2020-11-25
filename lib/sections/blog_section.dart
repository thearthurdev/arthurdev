import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/my_icons.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/blog_post_listtile.dart';
import 'package:arthurdev/widgets/info_action_box.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({
    Key key,
    @required this.initScreenHeight,
  }) : super(key: key);

  final double initScreenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kPrimaryColorDeep,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: kIsDesktop(context) ? desktopLayout() : tabletLayout(),
        ),
      ),
    );
  }

  Widget desktopLayout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: initScreenHeight * 0.16),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                blogInfoBox(),
                latestBlogPostsList(),
              ],
            ),
          ),
          SizedBox(height: initScreenHeight * 0.24),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reviewAuthorImagePlaceholder(size: 344.0),
                SizedBox(width: 80.0),
                Flexible(
                  child: Container(
                    height: 344.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            openQuotesIcon(32.0),
                            SizedBox(height: 16.0),
                            reviewBody(),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        reviewAuthor(),
                        SizedBox(height: 24.0),
                        reviewPageIndicator(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 64.0),
        ],
      ),
    );
  }

  Widget tabletLayout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 80.0),
          blogInfoBox(leftIndent: 16.0),
          SizedBox(height: 64.0),
          latestBlogPostsList(),
          SizedBox(height: 80.0),
          Container(
            height: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    reviewAuthorImagePlaceholder(size: 88.0),
                    SizedBox(width: 8.0),
                    reviewAuthor(),
                  ],
                ),
                SizedBox(height: 4.0),
                openQuotesIcon(16.0),
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 420.0),
                    child: reviewBody(maxLines: 3),
                  ),
                ),
                SizedBox(height: 8.0),
                reviewPageIndicator(),
                SizedBox(height: 64.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget blogInfoBox({double leftIndent}) {
    return InfoActionBox(
      sectionTitle: 'Blog',
      heading: 'What\'s new?\nSee my latest blog posts.',
      body: 'I write about tech tips and tricks,'
          '\nmy experiences and opinions now and then.',
      actionText: 'Visit blog',
      onActionTap: () async {
        String url = kBlogURL;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }

  Widget openQuotesIcon(double size) {
    return FittedBox(
      child: Icon(
        MyIcons.quote_left,
        size: size,
        color: kPrimaryColor,
      ),
    );
  }

  Widget reviewAuthorImagePlaceholder({double size}) {
    return FittedBox(
      child: Container(
        width: size ?? 344.0,
        height: size ?? 344.0,
        color: kTechnologyBoxColor,
      ),
    );
  }

  Widget reviewPageIndicator() {
    return FittedBox(
      child: Container(
        constraints: BoxConstraints(maxWidth: 480.0),
        child: Row(
          children: List.generate(4, (i) {
            return Container(
              width: 46.0,
              height: 8.0,
              margin: const EdgeInsets.only(right: 24.0),
              color: i == 0 ? kAccentColor : kPrimaryColor,
            );
          }),
        ),
      ),
    );
  }

  Widget reviewAuthor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'John Doe',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: kHeaderTextStyle.copyWith(
            fontSize: 16.0,
            letterSpacing: 1.0,
          ),
        ),
        Text(
          'CEO of Anonymous',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: kSectionInfoTextStyle,
        ),
      ],
    );
  }

  Widget reviewBody({int maxLines}) {
    return Container(
      child: Text(
        'An Amazing post. Really informative and refreshing '
        'to read. I have been given a whole new perspective '
        'on this topic. Keep up the good work!',
        maxLines: maxLines ?? 6,
        overflow: TextOverflow.ellipsis,
        style: kHeaderTextStyle.copyWith(height: 1.2),
      ),
    );
  }

  Widget latestBlogPostsList() {
    return Container(
      width: 560.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlogPostListTile(
            date: 'Feb 26',
            title: 'Developer or Superstar?',
          ),
          BlogPostListTile(
            date: 'Feb 14',
            title: 'My QodeHub Internship Experience',
          ),
          BlogPostListTile(
            date: 'Feb 09',
            title: 'scrcpy - Mirror Your Device\'s Screen! (Linux Edition)',
          ),
        ],
      ),
    );
  }
}
