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
        mainAxisSize: MainAxisSize.min,
        children: [
          sectionTitle == null
              ? SizedBox()
              : Text(
                  '— $sectionTitle',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kSectionInfoTextStyle,
                ),
          SizedBox(height: sectionTitle == null ? 0.0 : 8.0),
          heading == null
              ? SizedBox()
              : Text(
                  heading,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: kSectionHeaderTextStyle,
                ),
          SizedBox(height: body == null ? 0.0 : 24.0),
          body == null
              ? SizedBox()
              : Text(
                  body,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: kSectionInfoTextStyle,
                ),
          SizedBox(height: actionText == null ? 0.0 : 32.0),
          actionText == null
              ? SizedBox()
              : Material(
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
