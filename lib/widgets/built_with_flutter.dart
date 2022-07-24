import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class BuiltWithFlutter extends StatelessWidget {
  const BuiltWithFlutter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            text: 'Built with ',
            style: kHeaderTextStyleLight(context).copyWith(fontSize: 12.0),
            children: [
              TextSpan(
                text: 'Flutter ',
                style: kActionButtonTextStyle(context).copyWith(
                    fontSize: 12.0, color: Colors.blue[400]),
              ),
            ],
          ),
        ),
        Icon(
          Icons.favorite,
          color: Colors.blue[400],
          size: 16.0,
        )
      ],
    );
  }
}
