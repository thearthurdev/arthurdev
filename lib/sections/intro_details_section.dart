import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/profile.dart';
import 'package:flutter/material.dart';

class IntroDetailsSection extends StatelessWidget {
  const IntroDetailsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context)
        ? _buildDesktopView(context)
        : _buildMobileView(context);
  }

  Widget _buildDesktopView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColorLight1,
            kPrimaryColorLight2,
          ],
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        kScreenWidthAwareSize(60.0, context),
        kScreenHeightAwareSize(0.0, context),
        kScreenWidthAwareSize(60.0, context),
        kScreenHeightAwareSize(30.0, context),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -kScreenHeight(context) * 0.25,
            left: -500.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.person,
                color: kPrimaryColorDark,
                size: 800.0,
              ),
            ),
          ),
          Center(
            child: Profile(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return Container(
      key: kIntroSectionKey,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColorLight1,
            kPrimaryColorLight2,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -kScreenHeight(context) * 0.02,
            left: -300.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.person,
                color: kPrimaryColorDark,
                size: 600.0,
              ),
            ),
          ),
          Center(
            child: Profile(),
          ),
        ],
      ),
    );
  }
}
