import 'package:arthurdev/utils/consts.dart';
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
    return Container(
      width: 60.0,
      height: 60.0,
      margin: EdgeInsets.all(64.0),
      decoration: BoxDecoration(
        color: kDividerColor.withOpacity(0.5),
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
    );
  }
}
