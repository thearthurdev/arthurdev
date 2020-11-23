import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/my_icons.dart';
import 'package:flutter/material.dart';

class SocialsButtons extends StatelessWidget {
  final Map<String, IconData> socials = {
    'https://github.com/thearthurdev': MyIcons.github,
    'https://www.linkedin.com/arthurdelords/': MyIcons.linkedin,
    'https://twitter.com/_DeeArthur': MyIcons.twitter
  };

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 50.0 * socials.length,
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
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      socials.values.elementAt(i),
                      color: kPrimaryTextColor,
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
