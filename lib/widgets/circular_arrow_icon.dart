import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/my_icons.dart';
import 'package:flutter/material.dart';

class CircularArrowIcon extends StatelessWidget {
  const CircularArrowIcon() ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kDividerColor(context),
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(8.0),
      child: Icon(
        MyIcons.arrow_right,
        size: 16.0,
        color: kPrimaryTextColorDark(context),
      ),
    );
  }
}
