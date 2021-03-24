import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/material.dart';

class PageViewActionButton extends StatelessWidget {
  const PageViewActionButton(
    this.icon, {
    Key key,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 60.0,
        height: 60.0,
        margin: EdgeInsets.all(kScreenWidthAwareSize(48.0, context)),
        decoration: BoxDecoration(
          color: kDividerColor.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap ?? () {},
            customBorder: CircleBorder(),
            child: Icon(
              icon,
              size: 24.0,
              color: kPrimaryColorDark,
            ),
          ),
        ),
      ),
    );
  }
}
