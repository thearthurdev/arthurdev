import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/material.dart';

class PageViewActionButton extends StatelessWidget {
  const PageViewActionButton(
    this.icon, {
    
    this.onTap,
  }) ;

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        child: Container(
          width: 60.0,
          height: 60.0,
          margin: EdgeInsets.all(kScreenWidthAwareSize(48.0, context)),
          decoration: BoxDecoration(
            color: kDividerColor(context),
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
                color: kPrimaryTextColorDark(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
