import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArthurDevBanner extends StatelessWidget {
  const ArthurDevBanner(
      {required this.scrollController, this.isLarge = false});

  final bool isLarge;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        scrollController.animateTo(
          kSectionScrollOffsets[0]!,
          curve: Curves.easeOut,
          duration: kShortDuration,
        );
      },
      borderRadius: kBorderRadius,
      child: Container(
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                width: isLarge ? 80.0 : 42.0,
                height: isLarge ? 48.0 : 32.0,
                padding: EdgeInsets.only(left: 8.0),
                // child: Image.asset(
                //   kImageAssets['ArthurDevLogo'],
                //   fit: BoxFit.fitWidth,
                // ),
                child: SvgPicture.asset(
                  kImageAssets['ArthurDevLogoSVG']!,
                  semanticsLabel: 'ArthurDev Logo',
                ),
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
                  style: kHeaderTextStyleLight(context).copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
