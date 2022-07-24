import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/built_with_flutter.dart';
import 'package:arthurdev/widgets/socials_buttons.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context)
        ? _buildDesktopView(context)
        : _buildMobileView(context);
  }

  Widget _buildDesktopView(BuildContext context) {
    return Container(
      height: kToolbarHeight * 5.0,
      color: kPrimaryColorDark(context),
      padding: EdgeInsets.all(24.0),
      child: Center(
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 88.0,
                height: 88.0,
                child: Image.asset(
                  kImageAssets['ArthurDevLogo'],
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 24.0),
              RichText(
                text: TextSpan(
                  text: 'Thanks for dropping by,',
                  style:
                      kHeaderTextStyleLight(context).copyWith(fontSize: 16.0),
                  children: [
                    TextSpan(
                      text: ' visit again soon!',
                      style: kSectionInfoTextStyle(context).copyWith(
                          fontSize: 14.0, color: kAccentColor(context)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              SocialsButtons(),
              SizedBox(height: 32.0),
              BuiltWithFlutter(),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return Container(
      height: kToolbarHeight * 2.0,
      color: kPrimaryColorDark(context),
      padding: EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: FittedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: Image.asset(
                      kImageAssets['ArthurDevLogo'],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thanks for dropping by,',
                          style: kSectionInfoTextStyle(context).copyWith(
                            fontSize: 14.0,
                            color: kPrimaryTextColorDark(context),
                          ),
                        ),
                        Text(
                          ' visit again soon!',
                          style: kSectionInfoTextStyle(context).copyWith(
                            fontSize: 14.0,
                            color: kAccentColor(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 32.0),
          Flexible(
              child: Column(
            children: [
              SocialsButtons(size: 20.0),
              BuiltWithFlutter(),
            ],
          )),
        ],
      ),
    );
  }
}
