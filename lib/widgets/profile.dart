import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context)
        ? _buildDesktopView(context)
        : _buildMobileView(context);
  }

  Widget _buildDesktopView(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 436.0,
        height: 333.0,
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              right: 0.0,
              child: profilePic(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 48.0,
                  bottom: 10.0,
                ),
                child: profileName(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 1200.0,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: kScreenWidthAwareSize(80.0, context),
            vertical: kScreenHeightAwareSize(80.0, context),
          ),
          height: kScreenHeight(context) * 0.6,
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                profilePic(
                  height: 200.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: profileName(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profilePic({double width, double height}) {
    return SizedBox(
      width: width ?? 296.0,
      height: height ?? 333.0,
      child: Image.asset(
        kImageAssets['ProfilePic'],
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget profileName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: Text(
            'Meet',
            style: kSectionInfoTextStyle.copyWith(
              fontSize: kIsDesktop(context) ? 16.0 : 12.0,
            ),
          ),
        ),
        Text(
          'Delords\nArthur',
          style: kLargeHeaderTextStyle.copyWith(
            fontSize: kIsDesktop(context) ? 72.0 : 54.0,
          ),
        ),
        Container(
          width: 46.0,
          height: 8.0,
          margin: const EdgeInsets.only(left: 2.0),
          color: kAccentColorDeep,
        ),
      ],
    );
  }
}
