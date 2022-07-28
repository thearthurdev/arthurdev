import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/widgets/socials_buttons.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({Key key, @required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return PopupMenuTheme(
      data: PopupMenuThemeData(
        color: kPrimaryColor(context),
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
      ),
      child: PopupMenuButton(
        tooltip: 'Navigation Menu',
        icon: Icon(
          Icons.menu_rounded,
          color: kPrimaryTextColorLight(context),
        ),
        onSelected: (i) {
          if (i < kNavigationDestinations.length) {
            scrollController.animateTo(
              kSectionScrollOffsets[i],
              curve: Curves.easeOut,
              duration: kShortDuration,
            );
          }
        },
        itemBuilder: (context) {
          return List.generate(kNavigationDestinations.length + 1, (i) {
            return PopupMenuItem(
              value: i,
              child: i < kNavigationDestinations.length
                  ? Container(
                      padding: EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 0.0),
                      child: Text(
                        kNavigationDestinations[i].toUpperCase(),
                        style:
                            kNavigationDestinationTextStyle(context).copyWith(
                          fontSize: 14.0,
                          color: kPrimaryTextColorDark(context),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Divider(color: kDividerColor(context)),
                        Container(
                          child: SocialsButtons(
                            color: kPrimaryTextColorDark(context),
                            size: 18.0,
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
