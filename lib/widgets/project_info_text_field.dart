import 'package:arthurdev/utils/consts.dart';
import 'package:flutter/material.dart';

class ProjectInfoTextField extends StatelessWidget {
  ProjectInfoTextField({
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
      cursorColor: kAccentColorDeep(context),
      keyboardType: inputType,
      style: kTextFieldTextStyleDark(context),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: kTextFieldTextStyleDark(context),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kDividerColor(context),
            width: 1.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kDividerColor(context),
            width: 1.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 32.0),
      ),
    );
  }
}