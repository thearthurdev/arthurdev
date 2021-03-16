import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/circular_arrow_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobSectionLeft extends StatefulWidget {
  const JobSectionLeft({
    Key key,
  }) : super(key: key);

  @override
  _JobSectionLeftState createState() => _JobSectionLeftState();
}

class _JobSectionLeftState extends State<JobSectionLeft> {
  TextEditingController _nameFieldController;
  TextEditingController _emailFieldController;

  @override
  void initState() {
    super.initState();
    _nameFieldController = TextEditingController();
    _emailFieldController = TextEditingController();
  }

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
                        controller: _nameFieldController,
                        hint: 'What\'s your name?',
                        inputType: TextInputType.name,
                      ),
                      JobInfoTextField(
                        controller: _emailFieldController,
                        hint: 'And your fancy email?',
                        inputType: TextInputType.emailAddress,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () async {
                              String name = _nameFieldController.text;
                              String email = _emailFieldController.text;

                              String url =
                                  "$kEmailURL?subject=Project Collaboration Proposal&body=Hi Delords,%0D%0A%0D%0AI'm $name and I would like to collaborate with you on a project.%0D%0A%0D%0AHere's my fancy email, $email. Reach back to me and let's talk!";

                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
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
  JobInfoTextField({
    this.controller,
    this.hint,
    this.inputType,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autocorrect: false,
      textCapitalization: TextCapitalization.words,
      cursorColor: kAccentColorDeep,
      keyboardType: inputType,
      style: kTextFieldTextStyleDark,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: kTextFieldTextStyleDark,
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
