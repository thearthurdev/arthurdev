import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/my_icons.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/material.dart';

class BlogPostListTile extends StatelessWidget {
  const BlogPostListTile({Key key, this.date, this.title, this.url})
      : super(key: key);

  final String date;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context) ? desktopLayout() : tabletLayout();
  }

  Material desktopLayout() {
    return Material(
  type: MaterialType.transparency,
  child: Column(
    children: [
      ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        leading: Text(
          date,
          style: kSectionInfoTextStyle,
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 32.0),
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: kHeaderTextStyle.copyWith(
                fontSize: 22.0, letterSpacing: 1.0),
          ),
        ),
        trailing: Icon(
          MyIcons.arrow_right,
          size: 16.0,
          color: kAccentColor,
        ),
      ),
      Container(
        height: 1.0,
        color: kDividerColor,
      ),
    ],
  ),
);
  }

  Material tabletLayout() {
    return Material(
  type: MaterialType.transparency,
  child: Column(
    children: [
      ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        leading: Text(
          date,
          style: kSectionInfoTextStyle,
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 32.0),
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: kHeaderTextStyle.copyWith(
                fontSize: 18.0, letterSpacing: 1.0),
          ),
        ),
        trailing: Icon(
          MyIcons.arrow_right,
          size: 16.0,
          color: kAccentColor,
        ),
      ),
      Container(
        height: 1.0,
        color: kDividerColor,
      ),
    ],
  ),
);
  }
}
