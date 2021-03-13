import 'package:flutter/material.dart';

const double kMaxWidth = 1160.0;

BorderRadius kBorderRadius = BorderRadius.circular(6.0);

// Navigation Destinations
List<String> kNavigationDestinations = ['INTRO', 'PORTFOLIO', 'BLOG', 'JOB'];

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
GlobalKey kTechnologiesSectionKey = GlobalKey();
GlobalKey kExperienceSectionKey = GlobalKey();
GlobalKey kHomePageKey = GlobalKey();

List<GlobalKey> kSectionKeys = [
  kIntroSectionKey,
  kPortfolioSectionKey,
  kBlogSectionKey,
  kJobSectionKey,
  // kExperienceSectionKey,
  // kTechnologiesSectionKey,
];

// URLs
const String kGitHubURL = 'https://github.com/thearthurdev';
const String kLinkedInURL = 'https://www.linkedin.com/in/arthurdelords/';
const String kTwitterURL = 'https://twitter.com/_DeeArthur';
const String kEmailURL = 'mailto:arthurdelords@gmail.com';
const String kPortfolioURL = 'https://arthur.hashnode.dev/arthurdev-portfolio';
const String kBlogURL = 'https://arthur.hashnode.dev';

// Colors
const Color kPrimaryColor = Color(0xFF333646);
const Color kPrimaryColorDeep = Color(0xFF252734);
const Color kAccentColor = Color(0xFFFFBB69);
const Color kTechnologyBoxColor = Color(0xFF424657);
const Color kDividerColor = Color(0xFF3A3D4C);
const Color kPrimaryTextColor = Color(0xFFEBEBEC);
const Color kPrimaryTextDisabledColor = Color(0xFF666874);
const Color kSectionInfoTextColor = Color(0xFF999AA2);

// Animation Durations
const Duration kVeryShortDuration = Duration(milliseconds: 100);
const Duration kShortDuration = Duration(milliseconds: 300);
const Duration kMediumDuration = Duration(milliseconds: 600);
const Duration kLongDuration = Duration(milliseconds: 900);

// TextStyles
const TextStyle kLargeHeaderTextStyle = TextStyle(
  fontFamily: 'MontSerrat',
  fontSize: 64.0,
  letterSpacing: -0.1,
  height: 0.9,
  color: kPrimaryTextColor,
);

const TextStyle kHeaderTextStyle = TextStyle(
  fontFamily: 'Heebo',
  fontSize: 24.0,
  letterSpacing: -0.1,
  color: kPrimaryTextColor,
);

const TextStyle kSectionInfoTextStyle = TextStyle(
  fontFamily: 'Bree Serif',
  fontSize: 14.0,
  letterSpacing: 1.2,
  color: kSectionInfoTextColor,
);

const TextStyle kSectionHeaderTextStyle = TextStyle(
  fontFamily: 'Heebo',
  fontSize: 32.0,
  letterSpacing: 1.8,
  color: kPrimaryTextColor,
);

const TextStyle kActionButtonTextStyle = TextStyle(
  fontFamily: 'Heebo',
  fontSize: 24.0,
  letterSpacing: -0.1,
  color: kAccentColor,
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
