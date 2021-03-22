import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/circular_arrow_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPostListTile extends StatelessWidget {
  const BlogPostListTile({
    Key key,
    @required this.date,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  final String date;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context) ? _buildDesktopView() : _buildMobileView();
  }

  Future<void> _openBlogPost() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Material _buildDesktopView() {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => _openBlogPost(),
        borderRadius: kBorderRadius,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    child: Text(
                      date,
                      style: kSectionInfoTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kHeaderTextStyleDark,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  CircularArrowIcon(),
                ],
              ),
            ),
            Container(
              height: 1.0,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              color: kDividerColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileView() {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => _openBlogPost(),
        borderRadius: kBorderRadius,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 48.0,
                    child: Text(
                      date,
                      style: kSectionInfoTextStyle.copyWith(fontSize: 12.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: kHeaderTextStyleDark.copyWith(fontSize: 18.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  CircularArrowIcon(),
                ],
              ),
            ),
            Container(
              height: 1.0,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              color: kDividerColor,
            ),
          ],
        ),
      ),
    );
  }
}
