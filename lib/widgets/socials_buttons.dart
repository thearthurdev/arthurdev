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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          socials.length,
          (i) {
            return Container(
              margin: EdgeInsets.only(
                right: i != socials.length - 1 ? 16.0 : 0.0,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  socials.values.elementAt(i),
                  color: kPrimaryTextColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
