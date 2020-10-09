import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/material.dart';

class TechnologyButton extends StatelessWidget {
  const TechnologyButton({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    this.iconSize,
    this.isLarge = true,
    this.isSelected = false,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;
  final double iconSize;
  final bool isLarge;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: kIsDesktop(context) ? desktopLayout() : tabletLayout(),
    );
  }

  Widget desktopLayout() {
    return Container(
      width: 243.0,
      height: 243.0,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isSelected ? kAccentColor : kTechnologyBoxColor,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Positioned(
                top: -16.0,
                left: -16.0,
                child: Icon(
                  icon,
                  size: 280.0,
                  color: isSelected ? Color(0x60FAB665) : Color(0x6045495C),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        size: iconSize ?? 24.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 24.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: kHeaderTextStyle.copyWith(
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: kSectionInfoTextStyle.copyWith(
                              fontFamily: 'Heebo',
                              fontSize: 11.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabletLayout() {
    return Container(
      width: 149.0,
      height: 136.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isSelected ? kAccentColor : kTechnologyBoxColor,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Positioned(
                top: -6.0,
                left: 0.0,
                child: Icon(
                  icon,
                  size: 150.0,
                  color: isSelected ? Color(0x60FAB665) : Color(0x6045495C),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      size: iconSize ?? 24.0,
                      color: Colors.white,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      title,
                      style: kHeaderTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 20.0,
                        height: 1.2,
                      ),
                    ),
                    // SizedBox(height: 8.0),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kSectionInfoTextStyle.copyWith(
                        fontFamily: 'Heebo',
                        fontSize: 11.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
