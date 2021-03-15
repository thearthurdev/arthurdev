import 'package:flutter/material.dart';

const double kMaxWidth = 1160.0;

BorderRadius kBorderRadius = BorderRadius.circular(6.0);

// Navigation Destinations
List<String> kNavigationDestinations = ['Intro', 'Portfolio', 'Blog', 'Job'];

// Section scroll offsets
double kIntroSectionScrollOffset = 0.0;
double kPortfolioSectionScrollOffset = 1418.0;
double kBlogSectionScrollOffset = 3189.0;
double kJobSectionScrollOffset = 4167.0;

List<double> kSectionScrollOffsets = [
  kIntroSectionScrollOffset,
  kPortfolioSectionScrollOffset,
  kBlogSectionScrollOffset,
  kJobSectionScrollOffset,
];

// Global Keys
GlobalKey kIntroSectionKey = GlobalKey();
GlobalKey kPortfolioSectionKey = GlobalKey();
GlobalKey kBlogSectionKey = GlobalKey();
GlobalKey kJobSectionKey = GlobalKey();

List<GlobalKey> kSectionKeys = [
  kIntroSectionKey,
  kPortfolioSectionKey,
  kBlogSectionKey,
  kJobSectionKey,
];

// URLs
const String kGitHubURL = 'https://github.com/thearthurdev';
const String kLinkedInURL = 'https://www.linkedin.com/in/arthurdelords/';
const String kTwitterURL = 'https://twitter.com/_DeeArthur';
const String kEmailURL = 'mailto:arthurdelords@gmail.com';
const String kPortfolioURL = 'https://arthur.hashnode.dev/arthurdev-portfolio';
const String kBlogURL = 'https://arthur.hashnode.dev';

// Colors
const Color kPrimaryColor = Color(0xFFFFFFFF);
const Color kPrimaryColorDark = Color(0xFF000000);
const Color kPrimaryColorLight1 = Color(0xFFEAEAEA);
const Color kPrimaryColorLight2 = Color(0xFFD2D2D2);
const Color kAccentColor = Color(0xFFFFC279);
const Color kAccentColorDeep = Color(0xFFE49A41);
const Color kDividerColor = Color(0xFFC5C5C5);
const Color kPrimaryTextColorLight = Color(0xFFEBEBEC);
const Color kPrimaryTextColorDark = Color(0xFF000000);
const Color kPrimaryTextDisabledColor = Color(0xFF666874);
const Color kSectionInfoTextColor = Color(0xFF999AA2);

// Animation Durations
const Duration kVeryShortDuration = Duration(milliseconds: 100);
const Duration kShortDuration = Duration(milliseconds: 300);
const Duration kMediumDuration = Duration(milliseconds: 600);
const Duration kLongDuration = Duration(milliseconds: 900);

// TextStyles
const TextStyle kLargeHeaderTextStyle = TextStyle(
  fontFamily: 'SquadaOne',
  fontSize: 72.0,
  letterSpacing: 1.0,
  height: 0.9,
  color: kPrimaryTextColorDark,
);

const TextStyle kHeaderTextStyleLight = TextStyle(
  fontFamily: 'Sen',
  fontSize: 22.0,
  letterSpacing: -0.1,
  color: kPrimaryTextColorLight,
);

const TextStyle kHeaderTextStyleDark = TextStyle(
  fontFamily: 'SquadaOne',
  fontSize: 22.0,
  letterSpacing: 1.0,
  color: kPrimaryTextColorDark,
);

const TextStyle kTextFieldTextStyleDark = TextStyle(
  fontFamily: 'Sen',
  fontSize: 22.0,
  letterSpacing: 1.0,
  color: kPrimaryTextColorDark,
);

const TextStyle kSectionInfoTextStyle = TextStyle(
  fontFamily: 'Sen',
  fontSize: 16.0,
  color: kPrimaryTextColorDark,
);

const TextStyle kSectionHeaderTextStyle = TextStyle(
  fontFamily: 'SquadaOne',
  fontSize: 32.0,
  color: kPrimaryTextColorDark,
);

const TextStyle kActionButtonTextStyle = TextStyle(
  fontFamily: 'Sen',
  fontSize: 14.0,
  letterSpacing: 0.5,
  color: kAccentColor,
  fontWeight: FontWeight.bold,
);

const TextStyle kNavigationDestinationTextStyle = TextStyle(
  fontFamily: 'Sen',
  fontSize: 14.0,
  letterSpacing: 2.1,
  height: 0.9,
  fontWeight: FontWeight.w100,
  color: kSectionInfoTextColor,
);

const TextStyle kFlatAccentButtonTextStyle = TextStyle(
  fontFamily: 'sen',
  fontSize: 16.0,
  letterSpacing: -0.1,
  color: kAccentColor,
  fontWeight: FontWeight.w500,
);

const TextStyle kRaisedAccentButtonTextStyle = TextStyle(
  fontFamily: 'sen',
  fontSize: 16.0,
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
);

const TextStyle kErrorTextStyle = TextStyle(
  fontFamily: 'sen',
  fontSize: 12.0,
  // color: kErrorTextColor,
);
