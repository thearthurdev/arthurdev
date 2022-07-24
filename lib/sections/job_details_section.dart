import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/circular_arrow_icon.dart';
import 'package:arthurdev/widgets/project_info_text_field.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailsSection extends StatefulWidget {
  const JobDetailsSection({
    Key key,
  }) : super(key: key);

  @override
  _JobDetailsSectionState createState() => _JobDetailsSectionState();
}

class _JobDetailsSectionState extends State<JobDetailsSection> {
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
      key: kIsDesktop(context) ? null : kJobSectionKey,
      color: kPrimaryColorLight2(context),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Positioned(
              right: -80.0,
              top: kIsDesktop(context)
                  ? kScreenHeight(context) * 0.045
                  : kScreenHeight(context) * 0.015,
              child: Opacity(
                opacity: 0.02,
                child: Icon(
                  Icons.work,
                  color: kPrimaryTextColorLight(context),
                  size: kIsDesktop(context) ? 600.0 : 400.0,
                ),
              ),
            ),
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 540.0,
                ),
                height: kIsDesktop(context)
                    ? kScreenHeight(context)
                    : kScreenHeight(context) * 0.6,
                margin: EdgeInsets.all(32.0),
                padding: EdgeInsets.only(
                  bottom: kIsDesktop(context)
                      ? kScreenHeightAwareSize(80.0, context)
                      : 40.0,
                ),
                child: FittedBox(
                  fit: kIsDesktop(context) ? BoxFit.scaleDown : BoxFit.contain,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Want to collaborate on a project?'
                        '\nLet me know here.',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: kSectionHeaderTextStyle(context),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 420.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProjectInfoTextField(
                              controller: _nameFieldController,
                              hint: 'What\'s your name?',
                              inputType: TextInputType.name,
                            ),
                            ProjectInfoTextField(
                              controller: _emailFieldController,
                              hint: 'And your fancy email?',
                              inputType: TextInputType.emailAddress,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 24.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  onTap: () async {
                                    String name = _nameFieldController.text;
                                    String email = _emailFieldController.text;

                                    Uri url = Uri.parse(
                                        "$kEmailURL?subject=Project Collaboration Proposal"
                                        "&body=Hi Delords,%0D%0A%0D%0A"
                                        "My name's ${name.split(" ")[0]}"
                                        " and I'd like to collaborate with you on a project.%0D%0A%0D%0A"
                                        "[Please tell me about your idea here]%0D%0A%0D%0A"
                                        "Here's my fancy email, $email. Reach back to me and let's talk!%0D%0A%0D%0A"
                                        "Regards,%0D%0A"
                                        "$name.%0D%0A%0D%0A");

                                    if (!await launchUrl(url)) {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  borderRadius: kBorderRadius,
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 8.0, 4.0, 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Tell me about your idea',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: kTextFieldTextStyleDark(
                                                context),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
