import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PlatformAdaptiveScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    if (kIsWeb && kIsDesktop(context) || kIsDesktop(context)) {
      return NeverScrollableScrollPhysics();
    }

    if (Platform.isIOS) return BouncingScrollPhysics();

    return ClampingScrollPhysics();
  }
}
