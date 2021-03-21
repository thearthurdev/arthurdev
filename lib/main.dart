import 'package:arthurdev/pages/mobile_home_page.dart';
import 'package:arthurdev/providers/home_page_provider.dart';
import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/pages/desktop_home_page.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/utils/scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
          create: (_) => HomePageProvider(),
        )
      ],
      child: ArthurDev(),
    ),
  );
}

class ArthurDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArthurDev',
      home: HomePageBuilder(),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: PlatformAdaptiveScrollBehavior(),
          child: child,
        );
      },
    );
  }
}

class HomePageBuilder extends StatefulWidget {
  @override
  _HomePageBuilderState createState() => _HomePageBuilderState();
}

class _HomePageBuilderState extends State<HomePageBuilder> {
  double _initScreenHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initScreenHeight = _initScreenHeight ?? kScreenHeight(context) - 128.0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      int sectionIndex = -1;
      for (GlobalKey sectionKey in kSectionKeys) {
        sectionIndex++;
        try {
          final RenderBox sectionRenderBox =
              sectionKey.currentContext.findRenderObject();
          final sectionPosition =
              sectionRenderBox.localToGlobal(Offset(0.0, 0.0));
          kSectionScrollOffsets[sectionIndex] =
              sectionPosition.dy - (sectionIndex == 0 ? kToolbarHeight : 0.0);
        } catch (e) {
          print(e);
        }
      }
    });

    _precacheImageAssets(context);
  }

  static List<Image> _loadImageAssets(BuildContext context) {
    List<Image> imageAssets = [];

    kImageAssets.forEach((key, value) {
      imageAssets.add(Image.asset(value));
    });

    return imageAssets;
  }

  static Future<void> _precacheImageAssets(BuildContext context) async {
    for (Image asset in _loadImageAssets(context)) {
      await precacheImage(asset.image, context);
    }
  }

  // TODO: Syncronize scroll position between responsive views

  @override
  Widget build(BuildContext context) {
    return kResponsiveAttribute(
      context,
      desktop: DesktopHomePage(),
      mobile: MobileHomePage(),
    );
  }
}
