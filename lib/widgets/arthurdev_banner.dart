import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class ArthurDevBanner extends StatelessWidget {
  const ArthurDevBanner({Key key, this.isLarge = false}) : super(key: key);

  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: InkWell(
          onTap: () {},
          borderRadius: kBorderRadius,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: isLarge ? 88.0 : 46.0,
                height: isLarge ? 88.0 : 46.0,
                padding: EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  'assets/images/arthurdev_logo.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 0.0),
                  child: Text(
                    'ArthurDev',
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: kHeaderTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
