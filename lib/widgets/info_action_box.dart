import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/my_icons.dart';
import 'package:flutter/material.dart';

class InfoActionBox extends StatelessWidget {
  const InfoActionBox({
    Key key,
    this.sectionTitle,
    this.heading,
    this.body,
    this.actionText,
    this.onActionTap,
    this.leftIndent,
  }) : super(key: key);

  final String sectionTitle;
  final String heading;
  final String body;
  final String actionText;
  final Function onActionTap;
  final double leftIndent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: leftIndent ?? 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '— $sectionTitle',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: kSectionInfoTextStyle,
          ),
          SizedBox(height: 8.0),
          Text(
            heading,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: kSectionHeaderTextStyle,
          ),
          SizedBox(height: 24.0),
          Text(
            body,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: kSectionInfoTextStyle,
          ),
          SizedBox(height: 32.0),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onActionTap ?? () {},
              borderRadius: kBorderRadius,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        actionText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kActionButtonTextStyle,
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Icon(
                      MyIcons.arrow_right,
                      size: 16.0,
                      color: kAccentColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
