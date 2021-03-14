import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu(
      {Key key, @required this.currentSection, @required this.scrollController})
      : super(key: key);

  final int currentSection;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return PopupMenuTheme(
      data: PopupMenuThemeData(
        color: kPrimaryColorDark,
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
      ),
      child: PopupMenuButton(
        tooltip: 'Navigation Menu',
        icon: Icon(Icons.menu_rounded, color: kPrimaryTextColorLight),
        onSelected: (i) {
          scrollController.animateTo(
            kSectionScrollOffsets[i],
            curve: Curves.easeOut,
            duration: kShortDuration,
          );
        },
        itemBuilder: (context) {
          return List.generate(kNavigationDestinations.length, (i) {
            bool isSelected = currentSection == i;

            return PopupMenuItem(
              value: i,
              child: Row(
                children: [
                  Flexible(
                    child: Opacity(
                      opacity: isSelected ? 1.0 : 0.0,
                      child: Container(
                        width: 6.0,
                        height: 6.0,
                        margin: const EdgeInsets.only(
                            top: 0.0, bottom: 4.0, right: 16.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kAccentColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    kNavigationDestinations[i],
                    style: kHeaderTextStyleLight.copyWith(
                      fontSize: 16.0,
                      color: isSelected
                          ? kPrimaryTextColorLight
                          : kPrimaryTextDisabledColor,
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
