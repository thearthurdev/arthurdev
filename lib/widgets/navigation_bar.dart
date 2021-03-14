import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/arthurdev_banner.dart';
import 'package:arthurdev/widgets/navigation_menu.dart';
import 'package:arthurdev/widgets/navigation_destinations.dart';
import 'package:arthurdev/widgets/socials_buttons.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key key,
    @required this.currentSection,
    @required this.scrollController,
  }) : super(key: key);

  final int currentSection;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPrimaryColorDark,
      child: Container(
        height: kToolbarHeight,
        width: kScreenWidth(context),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: kMaxWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ArthurDevBanner(scrollController: scrollController),
                    SizedBox(width: 24.0),
                    NavigationDestinations(
                      currentSection: currentSection,
                      scrollController: scrollController,
                    ),
                  ],
                ),
                Expanded(child: SizedBox.shrink()),
                SocialsButtons(size: 18.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
