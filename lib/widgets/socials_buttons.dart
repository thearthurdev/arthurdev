import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialsButtons extends StatelessWidget {
  SocialsButtons({this.size});

  final double size;

  final Map<String, IconData> socials = {
    kGitHubURL: MyIcons.github,
    kLinkedInURL: MyIcons.linkedin,
    kTwitterURL: MyIcons.twitter,
  };

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 40.0 * socials.length,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            socials.length,
            (i) {
              return Material(
                type: MaterialType.transparency,
                child: InkWell(
                  customBorder: CircleBorder(),
                  onTap: () async {
                    String url = socials.keys.elementAt(i);
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      socials.values.elementAt(i),
                      color: kPrimaryTextColorLight,
                      size: size ?? null,
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
