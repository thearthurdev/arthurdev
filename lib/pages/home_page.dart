import 'package:arthurdev/sections/blog_section_left.dart';
import 'package:arthurdev/sections/blog_section_right.dart';
import 'package:arthurdev/sections/footer_section.dart';
import 'package:arthurdev/sections/intro_section_left.dart';
import 'package:arthurdev/sections/intro_section_right.dart';
import 'package:arthurdev/sections/job_section_left.dart';
import 'package:arthurdev/sections/job_section_right.dart';
import 'package:arthurdev/sections/portfolio_section_left.dart';
import 'package:arthurdev/sections/portfolio_section_right.dart';
import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/navigation_bar.dart';
import 'package:arthurdev/widgets/stack_clip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _mainScrollController;
  ScrollController _secondaryScrollController;
  ScrollController _currentScrollController;
  bool _freezeMainScrollController;
  int _currentSection;
  double _initScreenHeight;
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
    _currentSection = 0;
    _secondaryScrollControllerOffset = 0.0;
    _mainScrollControllerExtentBefore = 0.0;
    _mainScrollControllerExtentAfter = 0.0;
    _secondaryScrollControllerExtentBefore = 0.0;
    _currentScrollControllerExtentBefore = 0.0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initScreenHeight = _initScreenHeight ?? kScreenHeight(context) - 128.0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _maxMainScrollExtent = _mainScrollController.position.maxScrollExtent;
      _maxSecondaryScrollExtent =
          _secondaryScrollController.position.maxScrollExtent;

      int sectionIndex = -1;
      for (GlobalKey sectionKey in kSectionKeys) {
        sectionIndex++;
        try {
          final RenderBox sectionRenderBox =
              sectionKey.currentContext.findRenderObject();
          final sectionPosition = sectionRenderBox
              .localToGlobal(Offset(0.0, _secondaryScrollController.offset));
          kSectionScrollOffsets[sectionIndex] =
              sectionPosition.dy - (sectionIndex == 0 ? kToolbarHeight : 0.0);
        } catch (e) {
          print(e);
        }
      }
    });
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

    _changeCurrentSection();
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

      _changeCurrentSection();
    }
  }

  void _changeCurrentSection() {
    if (_secondaryScrollControllerOffset <= kSectionScrollOffsets[1])
      setState(() => _currentSection = 0);
    if (_secondaryScrollControllerOffset >= kSectionScrollOffsets[1])
      setState(() => _currentSection = 1);
    if (_secondaryScrollControllerOffset >= kSectionScrollOffsets[2])
      setState(() => _currentSection = 2);
    if (_secondaryScrollControllerOffset >= kSectionScrollOffsets[3])
      setState(() => _currentSection = 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Listener(
          onPointerSignal: (pointerSignal) {
            _handleWheelScrollEvents(pointerSignal);
          },
          child: SingleChildScrollView(
            controller: _mainScrollController,
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                NavigationBar(
                  currentSection: _currentSection,
                  scrollController: _secondaryScrollController,
                ),
                Container(
                  height: kScreenHeight(context),
                  child: Row(
                    children: [
                      LeftPanel(
                        _currentSection,
                        _secondaryScrollControllerOffset,
                        _secondaryScrollController,
                      ),
                      RightPanel(_secondaryScrollController),
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

class LeftPanel extends StatelessWidget {
  const LeftPanel(
    this.currentSection,
    this.secondaryScrollControllerOffset,
    this.secondaryScrollController,
  );

  final int currentSection;
  final double secondaryScrollControllerOffset;
  final ScrollController secondaryScrollController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
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
          backgroundWidget: IntroSectionLeft(),
          foregroundWidget: PortfolioSectionLeft(),
          scrollOffset: secondaryScrollControllerOffset -
              (kScreenHeight(context) * currentSection),
        );
      case 1:
        return StackClip(
          backgroundWidget: PortfolioSectionLeft(),
          foregroundWidget: BlogSectionLeft(),
          scrollOffset: secondaryScrollControllerOffset -
              (kScreenHeight(context) * currentSection) -
              (kToolbarHeight * currentSection),
        );
      case 2:
        return StackClip(
          backgroundWidget: BlogSectionLeft(),
          foregroundWidget: JobSectionLeft(),
          scrollOffset: secondaryScrollControllerOffset -
              (kScreenHeight(context) * currentSection) -
              (kToolbarHeight * currentSection),
        );
      case 3:
        return JobSectionLeft();
        break;
      default:
        return SizedBox.shrink();
    }
  }
}

class RightPanel extends StatelessWidget {
  const RightPanel(this.secondaryScrollController);

  final ScrollController secondaryScrollController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: SingleChildScrollView(
        controller: secondaryScrollController,
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          color: kPrimaryColor,
          padding: EdgeInsets.only(
            left: kScreenWidthAwareSize(60.0, context),
            right: kScreenWidthAwareSize(40.0, context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroSectionRight(),
              PortfolioSectionRight(),
              BlogSectionRight(),
              JobSectionRight(),
            ],
          ),
        ),
      ),
    );
  }
}
