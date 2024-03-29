import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/circular_arrow_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPostListTile extends StatelessWidget {
  const BlogPostListTile({
    required this.date,
    required this.title,
    required this.url,
  });

  final String date;
  final String title;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context)
        ? _buildDesktopView(context)
        : _buildMobileView(context);
  }

  Future<void> _openBlogPost() async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Material _buildDesktopView(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => _openBlogPost(),
        borderRadius: kBorderRadius,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 80.0,
                child: Text(
                  date,
                  style: kSectionInfoTextStyle(context),
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
                    style: kHeaderTextStyleDark(context),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              CircularArrowIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => _openBlogPost(),
        borderRadius: kBorderRadius,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 48.0,
                child: FittedBox(
                  child: Text(
                    date,
                    style:
                        kSectionInfoTextStyle(context).copyWith(fontSize: 16.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Container(
                  child: Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:
                        kHeaderTextStyleDark(context).copyWith(fontSize: 26.0),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              CircularArrowIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
