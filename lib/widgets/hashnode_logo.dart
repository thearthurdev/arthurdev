import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class HashnodeLogo extends StatelessWidget {
  const HashnodeLogo({
    Key key,
    this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 40.0,
      child: Opacity(
        opacity: 0.02,
        child: Container(
          width: size ?? 600.0,
          height: size ?? 600.0,
          decoration: BoxDecoration(
            color: kPrimaryColorDark(context),
            borderRadius:
                BorderRadius.circular(size != null ? size * 0.15 : 100.0),
          ),
          child: Center(
            child: Container(
              width: size != null ? size * 0.5 : 300.0,
              height: size != null ? size * 0.5 : 300.0,
              decoration: BoxDecoration(
                color: kPrimaryColorLight2(context),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
