import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/experience_info_box.dart';
import 'package:arthurdev/widgets/info_action_box.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    Key key,
    @required this.initScreenHeight,
  }) : super(key: key);

  final double initScreenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kPrimaryColorDeep,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: kIsDesktop(context) ? desktopLayout() : tabletLayout(),
        ),
      ),
    );
  }

  Widget desktopLayout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 64.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              children: [
                SizedBox(height: initScreenHeight * 0.16),
                contactInfoActionBox(),
                SizedBox(height: initScreenHeight * 0.2),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                SizedBox(height: initScreenHeight * 0.15),
                Container(
                  margin: EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExperienceInfoBox(),
                      SizedBox(height: initScreenHeight * 0.2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tabletLayout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80.0),
          ExperienceInfoBox(),
          SizedBox(height: 64.0),
          contactInfoActionBox(),
          SizedBox(height: 64.0),
        ],
      ),
    );
  }

  Widget contactInfoActionBox() {
    return InfoActionBox(
      sectionTitle: 'Contact',
      heading: 'Any type of query\n& discussion',
      body:
          'I am available to talk and I typically\nrespond within a few hours',
      actionText: 'arthurdelords@gmail.com',
      leftIndent: 16.0,
    );
  }
}

