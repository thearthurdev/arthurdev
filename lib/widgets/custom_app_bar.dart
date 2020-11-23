import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/arthurdev_banner.dart';
import 'package:arthurdev/widgets/navigation_menu.dart';
import 'package:arthurdev/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required this.showAppBar,
    @required this.currentSection,
    @required this.scrollController,
  }) : super(key: key);

  final bool showAppBar;
  final int currentSection;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: Duration(milliseconds: 800),
      curve: Curves.decelerate,
      alignment:
          showAppBar ? Alignment.topCenter : Alignment(0.0, -kToolbarHeight),
      child: Material(
        color: kPrimaryColor,
        elevation: 5.0,
        child: Container(
          height: kToolbarHeight,
          width: kScreenWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArthurDevBanner(scrollController: scrollController),
              kIsDesktop(context)
                  ? NavigationBar(
                      currentSection: currentSection,
                      scrollController: scrollController,
                    )
                  : NavigationMenu(
                      currentSection: currentSection,
                      scrollController: scrollController,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
