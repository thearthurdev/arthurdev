import 'dart:ui';

import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/my_icons.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/info_action_box.dart';
import 'package:arthurdev/widgets/socials_buttons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobSection extends StatelessWidget {
  const JobSection({
    Key key,
    @required this.initScreenHeight,
  }) : super(key: key);

  final double initScreenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kPrimaryColor,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64.0),
      child: Column(
        children: [
          SizedBox(height: initScreenHeight * 0.16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              jobActionBox(),
              projectEstimateBox(),
            ],
          ),
          SizedBox(height: 138.0),
          desktopFooter(),
          SizedBox(height: 64.0),
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
          SizedBox(height: 64.0),
          jobActionBox(),
          SizedBox(height: 64.0),
          projectEstimateBox(),
          SizedBox(height: 64.0),
          tabletFooter(),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }

  Widget desktopFooter() {
    return Column(
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
            style: kHeaderTextStyle.copyWith(fontSize: 16.0),
            children: [
              TextSpan(
                text: ' visit again soon!',
                style: kSectionInfoTextStyle.copyWith(fontSize: 14.0),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.0),
        SocialsButtons(),
      ],
    );
  }

  Widget tabletFooter() {
    return FittedBox(
      child: Container(
        constraints: BoxConstraints(maxWidth: 520.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  FittedBox(
                    child: SizedBox(
                      width: 64.0,
                      height: 64.0,
                      child: Image.asset(
                        'assets/images/arthurdev_logo.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: 'Thanks for dropping by,',
                        style: kHeaderTextStyle.copyWith(
                            fontSize: 16.0, height: 1.2),
                        children: [
                          TextSpan(
                            text: '\nvisit again soon!',
                            style: kSectionInfoTextStyle.copyWith(
                                fontSize: 14.0, height: 0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SocialsButtons(),
          ],
        ),
      ),
    );
  }

  Widget projectEstimateBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Want to do a project together?'
          '\nLet me know here.',
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: kSectionHeaderTextStyle,
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 420.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              jobInfoTextField(
                'What\'s your name?',
                TextInputType.name,
              ),
              jobInfoTextField(
                'Your fancy email',
                TextInputType.emailAddress,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24.0),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: kBorderRadius,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 4.0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Tell me about your project',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kHeaderTextStyle.copyWith(
                                fontSize: 18.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          SizedBox(width: 24.0),
                          Icon(
                            MyIcons.arrow_right,
                            size: 16.0,
                            color: kAccentColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget jobInfoTextField(String hint, TextInputType inputType) {
    return TextField(
      autocorrect: false,
      textCapitalization: TextCapitalization.words,
      cursorColor: kAccentColor,
      keyboardType: inputType,
      style: kHeaderTextStyle.copyWith(
        fontSize: 18.0,
        letterSpacing: 1.0,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: kHeaderTextStyle.copyWith(
          fontSize: 18.0,
          letterSpacing: 1.0,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kDividerColor,
            width: 2.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kDividerColor,
            width: 2.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 32.0),
      ),
    );
  }

  Widget jobActionBox({double leftIndent}) {
    return InfoActionBox(
      sectionTitle: 'Job',
      heading: 'Impressed?\nGive me a job.',
      body: 'I am looking for a part-time job or a\nfreelance project.',
      actionText: 'arthurdelords@gmail.com',
      onActionTap: () async {
        String url = kEmailURL;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}
