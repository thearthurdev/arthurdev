import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/profile.dart';
import 'package:flutter/material.dart';

class IntroDetailsSection extends StatelessWidget {
  const IntroDetailsSection();

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
            kPrimaryColorLight1(context),
            kPrimaryColorLight2(context),
          ],
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        kScreenWidthAwareSize(100.0, context),
        kScreenHeightAwareSize(20.0, context),
        kScreenWidthAwareSize(100.0, context),
        kScreenHeightAwareSize(50.0, context),
      ),
      child: FittedBox(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -450,
              left: -500.0,
              child: Opacity(
                opacity: 0.02,
                child: Icon(
                  Icons.person,
                  color: kPrimaryTextColorDark(context),
                  size: 800.0,
                ),
              ),
            ),
            Center(
              child: Profile(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return Container(
      key: kIntroSectionKey,
      color: kPrimaryColorLight1(context),
      child: Stack(
        children: [
          Positioned(
            bottom: -kScreenHeight(context) * 0.2,
            left: -300.0,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.person,
                color: kPrimaryTextColorDark(context),
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
