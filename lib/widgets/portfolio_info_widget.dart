import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class PortfolioInfoWidget extends StatelessWidget {
  const PortfolioInfoWidget({
    @required this.title,
    this.description,
    this.image,
    this.width,
    this.onTap,
    this.toolTip,
  });

  final String image;
  final String title;
  final String description;
  final String toolTip;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (toolTip == null) return buildView(context);

    return Tooltip(
      message: toolTip,
      waitDuration: kMediumDuration,
      decoration: BoxDecoration(
        color: kPrimaryColorDark(context),
        borderRadius: kBorderRadius,
      ),
      textStyle: kSectionInfoTextStyle(context).copyWith(
        fontSize: 12.0,
        color: kPrimaryTextColorLight(context),
      ),
      padding: EdgeInsets.all(8.0),
      preferBelow: true,
      verticalOffset: 32.0,
      child: buildView(context),
    );
  }

  InkWell buildView(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: width ?? 350.0),
        height: 100.0,
        margin: EdgeInsets.only(right: 48.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            image != null
                ? Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            image != null ? SizedBox(width: 8.0) : SizedBox.shrink(),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Text(title, style: kLargeHeaderTextStyle(context)),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Flexible(
                    child: Text(description,
                        style: kSectionInfoTextStyle(context)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
