import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class HashnodeLogo extends StatelessWidget {
  const HashnodeLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 40.0,
      child: Opacity(
        opacity: 0.02,
        child: Container(
          width: 600.0,
          height: 600.0,
          decoration: BoxDecoration(
            color: kPrimaryColorDark,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Center(
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: kPrimaryColorLight2,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
