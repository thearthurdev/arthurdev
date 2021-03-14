import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class ArthurDevBanner extends StatelessWidget {
  const ArthurDevBanner(
      {Key key, @required this.scrollController, this.isLarge = false})
      : super(key: key);

  final bool isLarge;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: InkWell(
          onTap: () {
            scrollController.animateTo(
              kSectionScrollOffsets[0],
              curve: Curves.easeOut,
              duration: kShortDuration,
            );
          },
          borderRadius: kBorderRadius,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: isLarge ? 80.0 : 42.0,
                height: isLarge ? 48.0 : 32.0,
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
                    style: kHeaderTextStyleLight.copyWith(fontSize: 18.0),
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
