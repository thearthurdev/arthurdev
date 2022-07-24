import 'package:arthurdev/providers/home_page_provider.dart';
import 'package:arthurdev/sections/blog_details_section.dart';
import 'package:arthurdev/sections/blog_info_section.dart';
import 'package:arthurdev/sections/footer_section.dart';
import 'package:arthurdev/sections/intro_details_section.dart';
import 'package:arthurdev/sections/intro_info_section.dart';
import 'package:arthurdev/sections/job_details_section.dart';
import 'package:arthurdev/sections/job_info_section.dart';
import 'package:arthurdev/sections/portfolio_details_section.dart';
import 'package:arthurdev/sections/portfolio_info_section.dart';
import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/navigation_bar.dart';
import 'package:arthurdev/widgets/stack_clip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopHomePage extends StatefulWidget {
  @override
  _DesktopHomePageState createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  ScrollController _mainScrollController;
  ScrollController _secondaryScrollController;
  ScrollController _currentScrollController;
  bool _freezeMainScrollController;
  // double _maxMainScrollExtent;
  double _maxSecondaryScrollExtent;
  double _secondaryScrollControllerOffset;
  double _mainScrollControllerExtentBefore;
  double _mainScrollControllerExtentAfter;
  double _secondaryScrollControllerExtentBefore;
  double _currentScrollControllerExtentBefore;

  @override
  void initState() {
    super.initState();

    _mainScrollController = ScrollController()
      ..addListener(_handleScrollEvents);
    _secondaryScrollController = ScrollController()
      ..addListener(_handleScrollEvents);

    _currentScrollController = _mainScrollController;
    _freezeMainScrollController = false;
    _secondaryScrollControllerOffset = 0.0;
    _mainScrollControllerExtentBefore = 0.0;
    _mainScrollControllerExtentAfter = 0.0;
    _secondaryScrollControllerExtentBefore = 0.0;
    _currentScrollControllerExtentBefore = 0.0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        // _maxMainScrollExtent = _mainScrollController.position.maxScrollExtent;
        _maxSecondaryScrollExtent =
            _secondaryScrollController.position.maxScrollExtent;
      },
    );
  }

  @override
  void dispose() {
    _mainScrollController.removeListener(_handleScrollEvents);
    _secondaryScrollController.removeListener(_handleScrollEvents);

    super.dispose();
  }

  void _handleScrollEvents() {
    setState(() {
      _secondaryScrollControllerOffset = _secondaryScrollController.offset;
    });

    context
        .read<HomePageProvider>()
        .changeCurrentSection(_secondaryScrollController.offset);
  }

  void _handleWheelScrollEvents(PointerSignalEvent pointerSignal) {
    _mainScrollControllerExtentBefore =
        _mainScrollController.position.extentBefore;

    _mainScrollControllerExtentAfter =
        _mainScrollController.position.extentAfter;

    _secondaryScrollControllerExtentBefore =
        _secondaryScrollController.position.extentBefore;

    _currentScrollController = _freezeMainScrollController
        ? _secondaryScrollController
        : _mainScrollController;

    _currentScrollControllerExtentBefore = _freezeMainScrollController
        ? _secondaryScrollControllerExtentBefore
        : _mainScrollControllerExtentBefore;

    if (pointerSignal is PointerScrollEvent) {
      double scrollDirection = pointerSignal.scrollDelta.direction;
      double scrollDelta = kToolbarHeight;

      // If user is scrolling down
      if (scrollDirection > 0) {
        // Freeze main scroll controller to hide nav bar
        if (_mainScrollControllerExtentBefore == 0.0 &&
            _freezeMainScrollController == false) {
          setState(() => _freezeMainScrollController = true);
        }

        // Unfreeze main scroll controller to show footer
        if (_secondaryScrollControllerExtentBefore ==
                _maxSecondaryScrollExtent &&
            _freezeMainScrollController == true) {
          setState(() => _freezeMainScrollController = false);
        }

        _currentScrollController.position.moveTo(
          _currentScrollControllerExtentBefore + scrollDelta,
        );
      }

      // If user is scrolling up
      if (scrollDirection < 0) {
        // Unfreeze main scroll controller to show nav bar
        if (_secondaryScrollControllerExtentBefore <= kToolbarHeight &&
            _freezeMainScrollController == true) {
          setState(() => _freezeMainScrollController = false);
        }

        // Freeze main scroll controller when footer is hidden
        if (_mainScrollControllerExtentAfter == kToolbarHeight * 4.0 &&
            _freezeMainScrollController == false) {
          setState(() => _freezeMainScrollController = true);
        }

        _currentScrollController.position.moveTo(
          _currentScrollControllerExtentBefore - scrollDelta,
        );
      }

      context
          .read<HomePageProvider>()
          .changeCurrentSection(_secondaryScrollController.offset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor(context),
      body: SafeArea(
        child: Listener(
          onPointerSignal: (pointerSignal) {
            _handleWheelScrollEvents(pointerSignal);
          },
          child: SingleChildScrollView(
            controller: _mainScrollController,
            child: Column(
              children: [
                MyNavigationBar(
                  currentSection:
                      context.read<HomePageProvider>().currentSection,
                  scrollController: _secondaryScrollController,
                ),
                Container(
                  height: kScreenHeight(context),
                  child: Row(
                    children: [
                      DetailsPanel(
                        context.read<HomePageProvider>().currentSection,
                        _secondaryScrollControllerOffset,
                        _secondaryScrollController,
                      ),
                      InfoPanel(_secondaryScrollController),
                    ],
                  ),
                ),
                FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsPanel extends StatelessWidget {
  const DetailsPanel(
    this.currentSection,
    this.secondaryScrollControllerOffset,
    this.secondaryScrollController,
  );

  final int currentSection;
  final double secondaryScrollControllerOffset;
  final ScrollController secondaryScrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: kScreenHeight(context) + kToolbarHeight,
        child: buildSection(context),
      ),
    );
  }

  Widget buildSection(BuildContext context) {
    switch (currentSection) {
      case 0:
        return StackClip(
          backgroundWidget: IntroDetailsSection(),
          foregroundWidget: PortfolioDetailsSection(),
          scrollOffset: secondaryScrollControllerOffset -
              (kScreenHeight(context) * currentSection),
        );
      case 1:
        return StackClip(
          backgroundWidget: PortfolioDetailsSection(),
          foregroundWidget: BlogDetailsSection(),
          scrollOffset: secondaryScrollControllerOffset -
              (kScreenHeight(context) * currentSection) -
              (kToolbarHeight * currentSection),
        );
      case 2:
        return StackClip(
          backgroundWidget: BlogDetailsSection(),
          foregroundWidget: JobDetailsSection(),
          scrollOffset: secondaryScrollControllerOffset -
              (kScreenHeight(context) * currentSection) -
              (kToolbarHeight * currentSection),
        );
      case 3:
        return JobDetailsSection();
        break;
      default:
        return SizedBox.shrink();
    }
  }
}

class InfoPanel extends StatelessWidget {
  const InfoPanel(this.secondaryScrollController);

  final ScrollController secondaryScrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: secondaryScrollController,
      child: Container(
        width: kScreenWidthAwareSize(300.0, context),
        color: kPrimaryColor(context),
        padding: EdgeInsets.only(
          left: kScreenWidthAwareSize(60.0, context),
          right: kScreenWidthAwareSize(40.0, context),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroInfoSection(),
              PortfolioInfoSection(),
              BlogInfoSection(),
              JobInfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}
