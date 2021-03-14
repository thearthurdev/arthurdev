import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/circular_arrow_icon.dart';
import 'package:flutter/material.dart';


class JobSectionLeft extends StatelessWidget {
  const JobSectionLeft({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColorLight2,
            kPrimaryColorLight1,
          ],
        ),
      ),
      padding: EdgeInsets.only(bottom: kScreenHeightAwareSize(40.0, context)),
      child: Stack(
        children: [
          Positioned(
            right: -80.0,
            bottom: kScreenHeight(context) * 0.14,
            child: Opacity(
              opacity: 0.02,
              child: Icon(
                Icons.work,
                color: kPrimaryColorDark,
                size: 600.0,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Want to collaborate on a project?'
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
                      JobInfoTextField(
                        'What\'s your name?',
                        TextInputType.name,
                      ),
                      JobInfoTextField(
                        'And your fancy email?',
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
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 4.0, 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Tell me about your idea',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: kTextFieldTextStyleDark.copyWith(
                                          fontSize: 18.0),
                                    ),
                                  ),
                                  SizedBox(width: 24.0),
                                  CircularArrowIcon(),
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
            ),
          ),
        ],
      ),
    );
  }
}

class JobInfoTextField extends StatelessWidget {
  JobInfoTextField(this.hint, this.inputType);

  final String hint;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      textCapitalization: TextCapitalization.words,
      cursorColor: kAccentColorDeep,
      keyboardType: inputType,
      style: kTextFieldTextStyleDark,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: kTextFieldTextStyleDark.copyWith(fontSize: 18.0),
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
}
