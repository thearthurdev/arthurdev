import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class InfoActionWidget extends StatelessWidget {
  const InfoActionWidget({
    this.sectionTitle,
    this.heading,
    this.body,
    this.actionText,
    this.onActionTap,
    this.leftIndent,
  }) ;

  final String? sectionTitle;
  final String? heading;
  final String? body;
  final String? actionText;
  final VoidCallback? onActionTap;
  final double? leftIndent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24.0),
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
                  style: kSectionInfoTextStyle(context),
                ),
          SizedBox(height: sectionTitle == null ? 0.0 : 8.0),
          heading == null
              ? SizedBox()
              : Text(
                  heading!.toUpperCase(),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: kSectionHeaderTextStyle(context),
                ),
          SizedBox(height: body == null ? 0.0 : 16.0),
          body == null
              ? SizedBox()
              : Text(
                  body!,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: kSectionInfoTextStyle(context),
                ),
          SizedBox(height: actionText == null ? 0.0 : 32.0),
          actionText == null
              ? SizedBox()
              : Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColorDark(context),
                    borderRadius: kBorderRadius,
                  ),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: onActionTap ?? () {},
                      borderRadius: kBorderRadius,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                actionText!.toUpperCase(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: kActionButtonTextStyle(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
