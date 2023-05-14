import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

const double kMaxWidth = 1360.0;

BorderRadius kBorderRadius = BorderRadius.circular(6.0);

// Navigation Destinations
List<String> kNavigationDestinations = ['Intro', 'Portfolio', 'Blog', 'Job'];

// Section scroll offsets
double? kIntroSectionScrollOffset;
double? kPortfolioSectionScrollOffset;
double? kBlogSectionScrollOffset;
double? kJobSectionScrollOffset;

List<double?> kSectionScrollOffsets = [
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
    'https://docs.google.com/document/d/1TtF09lgVIsEG3-6ttsbKvcZoEi-uQFs2/edit?usp=sharing&ouid=102753117759568809536&rtpof=true&sd=true');

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

bool kIsDarkMode(BuildContext context) {
  return SystemTheme.isDarkMode;
}

// Colors
Color kPrimaryColor(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFF2B2B2B) : Color(0xFFFFFFFF);
}

Color kPrimaryColorDark(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFF000000) : Color(0xFF000000);
}

Color kPrimaryColorLight1(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFF3B3B3B) : Color(0xFFEAEAEA);
}

Color kPrimaryColorLight2(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFF3B3B3B) : Color(0xFFD2D2D2);
}

Color kAccentColor(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFFFFC279) : Color(0xFFFFC279);
}

Color kAccentColorDeep(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFFE49A41) : Color(0xFFE49A41);
}

Color kDividerColor(BuildContext context) {
  return kIsDarkMode(context)
      ? Color(0xFFC5C5C5).withOpacity(0.4)
      : Color(0xFFC5C5C5);
}

Color kPrimaryTextColorLight(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFFFFFFFF) : Color(0xFFEBEBEC);
}

Color kPrimaryTextColorDark(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFFFFFFFF) : Color(0xFF000000);
}

Color kPrimaryTextDisabledColor(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFF666874) : Color(0xFF666874);
}

Color kSectionInfoTextColor(BuildContext context) {
  return kIsDarkMode(context) ? Color(0xFF999AA2) : Color(0xFF999AA2);
}

// Animation Durations
const Duration kVeryShortDuration = Duration(milliseconds: 100);
const Duration kShortDuration = Duration(milliseconds: 300);
const Duration kMediumDuration = Duration(milliseconds: 600);
const Duration kLongDuration = Duration(milliseconds: 900);

// TextStyles
TextStyle kLargeHeaderTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: 'SquadaOne',
    fontSize: 72.0,
    letterSpacing: 1.0,
    height: 0.9,
    color: kPrimaryTextColorDark(context),
  );
}

TextStyle kHeaderTextStyleLight(BuildContext context) {
  return TextStyle(
    fontFamily: 'Sen',
    fontSize: 22.0,
    letterSpacing: -0.1,
    color: kPrimaryTextColorLight(context),
  );
}

TextStyle kHeaderTextStyleDark(BuildContext context) {
  return TextStyle(
    fontFamily: 'SquadaOne',
    fontSize: 22.0,
    letterSpacing: 1.0,
    color: kPrimaryTextColorDark(context),
  );
}

TextStyle kTextFieldTextStyleDark(BuildContext context) {
  return TextStyle(
    fontFamily: 'Sen',
    fontSize: 16.0,
    color: kPrimaryTextColorDark(context),
  );
}

TextStyle kSectionInfoTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: 'Sen',
    fontSize: 16.0,
    color: kPrimaryTextColorDark(context),
  );
}

TextStyle kSectionHeaderTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: 'SquadaOne',
    fontSize: 32.0,
    color: kPrimaryTextColorDark(context),
  );
}

TextStyle kActionButtonTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: 'Sen',
    fontSize: 14.0,
    letterSpacing: 0.5,
    color: kAccentColor(context),
    fontWeight: FontWeight.bold,
  );
}

TextStyle kNavigationDestinationTextStyle(BuildContext context) {
  return TextStyle(
    fontFamily: 'Sen',
    fontSize: 14.0,
    letterSpacing: 2.1,
    height: 0.9,
    color: kSectionInfoTextColor(context),
  );
}
