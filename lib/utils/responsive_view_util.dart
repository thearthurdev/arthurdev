import 'package:flutter/material.dart';

const double mobileBreakPoint = 690.0;
const double tabletBreakPoint = 820.0;

double kScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double kScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool kIsDesktop(BuildContext context) {
  return kScreenWidth(context) > tabletBreakPoint &&
      kScreenHeight(context) < kScreenWidth(context);
}

bool kIsTablet(BuildContext context) {
  return kScreenWidth(context) <= tabletBreakPoint &&
      kScreenWidth(context) > mobileBreakPoint;
}

bool kIsMobile(BuildContext context) {
  return kScreenWidth(context) <= mobileBreakPoint;
}

double kScreenWidthAwareSize(double size, BuildContext context) {
  return size * kScreenWidth(context) / mobileBreakPoint;
}

double kScreenHeightAwareSize(double size, BuildContext context) {
  return size * kScreenHeight(context) / mobileBreakPoint;
}

dynamic kResponsiveAttribute(
  BuildContext context, {
  dynamic desktop,
  dynamic tablet,
  dynamic mobile,
}) {
  dynamic attribute;

  bool isDesktop = desktop != null && kIsDesktop(context) ||
      tablet == null && mobile == null;

  bool isTablet = tablet != null && kIsTablet(context) || mobile == null;

  bool isMobile = mobile != null && kIsMobile(context) || tablet == null;

  print(isDesktop);

  if (isDesktop) {
    attribute = desktop;
  } else if (isTablet) {
    attribute = tablet;
  } else if (isMobile) {
    attribute = mobile;
  }

  return attribute;
}

// class ResponsiveViewBuilder extends StatelessWidget {
//   const ResponsiveViewBuilder({
//     Key key,
//     this.desktop,
//     this.tablet,
//     this.mobile,
//   }) : super(key: key);

//   final dynamic desktop;
//   final dynamic tablet;
//   final dynamic mobile;

//   @override
//   Widget build(BuildContext context) {
//     Widget child;
//     double screenWidth = MediaQuery.of(context).size.width;

//     bool isDesktop = screenWidth > tabletBreakPoint;
//     bool isTablet =
//         screenWidth <= tabletBreakPoint && screenWidth > mobileBreakPoint;
//     bool isMobile = screenWidth <= mobileBreakPoint;

//     if (desktop != null && isDesktop || tablet == null) {
//       child = desktop;
//     } else if (tablet != null && isTablet || mobile == null) {
//       child = tablet;
//     } else if (mobile != null && isMobile) {
//       child = mobile;
//     }

//     return child;
//   }
// }
