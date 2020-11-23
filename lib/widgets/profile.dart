import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/socials_buttons.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: kIsDesktop(context)
          ? desktopLayout()
          : kIsTablet(context)
              ? desktopLayout()
              : mobileLayout(),
    );
  }

  Widget desktopLayout() {
    return Container(
      width: 469.0,
      height: 333.0,
      child: Stack(
        children: [
          profilePic(),
          profileName(Alignment.centerLeft),
        ],
      ),
    );
  }

  Widget mobileLayout() {
    return Container(
      width: 288.0,
      height: 400.0,
      child: Stack(
        children: [
          profilePic(),
          profileName(Alignment.bottomCenter),
        ],
      ),
    );
  }

  Positioned profilePic() {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: SizedBox(
        width: 296.0,
        height: 333.0,
        child: Image.asset(
          'assets/images/profile_pic.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget profileName(AlignmentGeometry alignment) {
    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: alignment == Alignment.centerLeft
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text('Arthur', style: kLargeHeaderTextStyle),
          ),
          Text('Delords', style: kLargeHeaderTextStyle),
          Container(
            width: 46.0,
            height: 8.0,
            margin: const EdgeInsets.only(left: 4.0, top: 16.0),
            color: kAccentColor,
          ),
          SizedBox(height: 10.0),
          SocialsButtons(),
        ],
      ),
    );
  }
}
