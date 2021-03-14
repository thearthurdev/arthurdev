import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/widgets/socials_buttons.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 5.0,
      color: kPrimaryColorDark,
      child: Center(
        child: FittedBox(
          child: Container(
            margin: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 88.0,
                  height: 88.0,
                  child: Image.asset(
                    'assets/images/arthurdev_logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(height: 24.0),
                RichText(
                  text: TextSpan(
                    text: 'Thanks for dropping by,',
                    style: kHeaderTextStyleLight.copyWith(fontSize: 16.0),
                    children: [
                      TextSpan(
                        text: ' visit again soon!',
                        style: kSectionInfoTextStyle.copyWith(
                            fontSize: 14.0, color: kAccentColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.0),
                SocialsButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
