import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key, this.currentSection}) : super(key: key);

  final int currentSection;

  @override
  Widget build(BuildContext context) {
    final List<String> navigationDestinations = [
      'Home',
      'Works',
      'Blog',
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 12.0, 16.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          navigationDestinations.length,
          (i) {
            bool isSelected = currentSection == i;

            return Container(
              margin: EdgeInsets.only(
                right: i != navigationDestinations.length - 1 ? 24.0 : 0.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: kBorderRadius,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          navigationDestinations[i],
                          style: kHeaderTextStyle.copyWith(
                            color: isSelected
                                ? kPrimaryTextColor
                                : kPrimaryTextDisabledColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Opacity(
                      opacity: isSelected ? 1.0 : 0.0,
                      child: Container(
                        width: 6.0,
                        height: 6.0,
                        margin: const EdgeInsets.only(top: 0.0, bottom: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kAccentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
