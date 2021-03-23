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
        ? _buildDesktopView()
        : _buildMobileView(context);
  }

  Widget _buildDesktopView() {
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
                child: profileName(),
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
          padding: EdgeInsets.all(
            kScreenWidthAwareSize(30.0, context),
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
                  child: profileName(),
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

  Widget profileName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: Text('Meet', style: kSectionInfoTextStyle),
        ),
        SizedBox(height: 8.0),
        Text('Delords\nArthur', style: kLargeHeaderTextStyle),
        Container(
          width: 46.0,
          height: 8.0,
          margin: const EdgeInsets.only(left: 4.0, top: 8.0),
          color: kAccentColorDeep,
        ),
      ],
    );
  }
}
