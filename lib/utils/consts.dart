import 'package:flutter/material.dart';

const double kMaxWidth = 1360.0;

BorderRadius kBorderRadius = BorderRadius.circular(6.0);

// Navigation Destinations
List<String> kNavigationDestinations = ['Intro', 'Portfolio', 'Blog', 'Job'];

// Section scroll offsets
double kIntroSectionScrollOffset;
double kPortfolioSectionScrollOffset;
double kBlogSectionScrollOffset;
double kJobSectionScrollOffset;

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

// Images
Map<String, String> kImageAssets = {
  'ArthurDevLogo': 'assets/images/arthurdev_logo.png',
  'ArthurDevLogoSVG': 'assets/svg/arthurdev_logo.svg',
  'ProfilePic': 'assets/images/profile_pic.png',
  'PlayStoreButton': 'assets/images/play_store_button.png',
  'MobWearLogo': 'assets/images/mobwear_logo.png',
  'MobWearDevice': 'assets/images/mobwear_device.png',
  'PlayaDeviceLaptop': 'assets/images/playa_device_laptop.png',
  'PlayaDevicePhone': 'assets/images/playa_device_phone.png',
  'SneakPeakDevice': 'assets/images/sneak_peak_device.png',
};

// URLs
Uri kGitHubURL = Uri.parse('https://github.com/thearthurdev');
Uri kLinkedInURL = Uri.parse('https://www.linkedin.com/in/arthurdelords/');
Uri kTwitterURL = Uri.parse('https://twitter.com/thearthurdev');
Uri kEmailURL = Uri.parse('mailto:arthurdelords@gmail.com');
Uri kPortfolioURL = Uri.parse('https://blog.thearthur.dev/arthurdev-portfolio');
Uri kBlogURL = Uri.parse('https://blog.thearthur.dev');
Uri kMobWearGitHubURL = Uri.parse('https://github.com/thearthurdev/mobwear');
Uri kMobWearPlayStoreURL = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.arthurdev.mobwear');
Uri kSneakPeakTwitterURL =
    Uri.parse('https://twitter.com/_DeeArthur/status/1246287315707797505');
Uri kPlayaTwitterURL =
    Uri.parse('https://twitter.com/_DeeArthur/status/1356754726809960449');
Uri kBlogRSSURL = Uri.parse('https://blog.thearthur.dev/rss.xml');
Uri kResumeURL = Uri.parse(
    'https://docs.google.com/document/d/1a5JzACnhgusFIQYJzqKSFp4eWOEf7QlSmtY818kgrO0/edit?usp=sharing');

List<Uri> kBlogPostURLs = [
  Uri.parse(
      'https://blog.thearthur.dev/sharing-info-rich-links-of-your-flutter-website-using-meta-tags'),
  Uri.parse(
      'https://blog.thearthur.dev/recreating-the-iconic-star-wars-intro-in-flutter'),
  Uri.parse(
      'https://blog.thearthur.dev/how-to-migrate-your-whatsapp-chats-to-telegram'),
];

// Blog Posts
const Map<String, String> kBlogPosts = {
  'Apr 18': 'Sharing info-rich links of your Flutter Website using Meta Tags',
  'Jan 31': 'Recreating the iconic Star Wars Intro in Flutter',
  'Jan 14': 'How to Migrate your WhatsApp Chats to Telegram',
};

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
  fontSize: 16.0,
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
  color: kSectionInfoTextColor,
);
