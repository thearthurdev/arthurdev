import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/custom_icons.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/technology_button.dart';
import 'package:flutter/material.dart';

class TechnologiesSection extends StatelessWidget {
  const TechnologiesSection({
    Key key,
    @required this.initScreenHeight,
  }) : super(key: key);

  final double initScreenHeight;

  @override
  Widget build(BuildContext context) {
    return !kIsDesktop(context)
        ? SizedBox()
        : Container(
            key: kTechnologiesSectionKey,
            width: double.infinity,
            height: 243.0,
            color: kPrimaryColorDeep,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: kPrimaryColorDeep,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: kMaxWidth),
                    padding: EdgeInsets.symmetric(horizontal: 80.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TechnologyButton(
                          icon: CustomIcons.ic_flutter,
                          title: 'Flutter SDK\n& Dart',
                          subtitle: '4 Projects',
                          isSelected: true,
                        ),
                        TechnologyButton(
                          icon: CustomIcons.ic_kotlin,
                          iconSize: 20.0,
                          title: 'Android SDK\n& Kotlin',
                          subtitle: '2 Projects',
                        ),
                        TechnologyButton(
                          icon: CustomIcons.ic_settings,
                          title: 'Tasker, GCP,\netc.',
                          subtitle: '6 Projects',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
