import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class NavigationDestinations extends StatelessWidget {
  const NavigationDestinations({
    Key key,
    @required this.currentSection,
    @required this.scrollController,
  }) : super(key: key);

  final int currentSection;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          kNavigationDestinations.length,
          (i) {
            return Container(
              margin: EdgeInsets.only(
                right: i != kNavigationDestinations.length - 1 ? 24.0 : 0.0,
              ),
              child: InkWell(
                onTap: () {
                  scrollController.animateTo(
                    kSectionScrollOffsets[i],
                    curve: Curves.easeOut,
                    duration: kMediumDuration,
                  );
                },
                borderRadius: kBorderRadius,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text(
                      kNavigationDestinations[i].toUpperCase(),
                      style: kNavigationDestinationTextStyle,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
