import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialsButtons extends StatelessWidget {
  SocialsButtons({this.size, this.color});

  final double size;
  final Color color;

  final Map<String, IconData> _socials = {
    kEmailURL: Icons.email,
    kGitHubURL: MyIcons.github,
    kLinkedInURL: MyIcons.linkedin,
    kTwitterURL: MyIcons.twitter,
  };

  final List<String> _socialsToolTips = [
    'Send me an Email',
    'Check out my repos',
    'View my professional profile',
    'See what\'s happening',
  ];

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 40.0 * _socials.length,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _socials.length,
            (i) {
              return Tooltip(
                message: _socialsToolTips[i],
                waitDuration: kMediumDuration,
                decoration: BoxDecoration(
                  color: kPrimaryColorLight1,
                  borderRadius: kBorderRadius,
                ),
                textStyle: kSectionInfoTextStyle.copyWith(fontSize: 12.0),
                padding: EdgeInsets.all(8.0),
                preferBelow: true,
                verticalOffset: 32.0,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () async {
                      String url = _socials.keys.elementAt(i);
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        _socials.values.elementAt(i),
                        color: color ?? kPrimaryTextColorLight,
                        size: size ?? null,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
