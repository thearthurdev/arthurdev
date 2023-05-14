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
import 'package:arthurdev/utils/persistent_header_delegate.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/arthurdev_banner.dart';
import 'package:arthurdev/widgets/navigation_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileHomePage extends StatefulWidget {
  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  late ScrollController _scrollController;
  late double _scrollControllerExtentBefore;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_handleScrollEvents);
    _scrollControllerExtentBefore = 0.0;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScrollEvents);
    super.dispose();
  }

  void _handleScrollEvents() {
    context
        .read<HomePageProvider>()
        .changeScrollOffset(_scrollController.offset);

    context
        .read<HomePageProvider>()
        .changeCurrentSection(_scrollController.offset);
  }

  void _handleWheelScrollEvents(PointerSignalEvent pointerSignal) {
    double scrollDelta = kToolbarHeight;

    _scrollControllerExtentBefore = _scrollController.position.extentBefore;

    _scrollController.position.moveTo(
      _scrollControllerExtentBefore + scrollDelta,
    );

    if (pointerSignal is PointerScrollEvent) {
      double scrollDirection = pointerSignal.scrollDelta.direction;
      double scrollDelta = kToolbarHeight;

      // If user is scrolling down
      if (scrollDirection > 0) {
        _scrollController.position.moveTo(
          _scrollControllerExtentBefore + scrollDelta,
        );
      }

      // If user is scrolling up
      if (scrollDirection < 0) {
        _scrollController.position.moveTo(
          _scrollControllerExtentBefore - scrollDelta,
        );
      }

      context
          .read<HomePageProvider>()
          .changeCurrentSection(_scrollController.offset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor(context),
        body: Listener(
          onPointerSignal: (pointerSignal) {
            _handleWheelScrollEvents(pointerSignal);
          },
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                centerTitle: true,
                backgroundColor: kPrimaryColorDark(context),
                title: ArthurDevBanner(scrollController: _scrollController),
                actions: [
                  NavigationMenu(
                    scrollController: _scrollController,
                  ),
                ],
              ),
              SliverDetailsSection(
                sectionIndex: 0,
                child: IntroDetailsSection(),
              ),
              SliverInfoSection(
                sectionIndex: 0,
                child: IntroInfoSection(),
              ),
              SliverDetailsSection(
                sectionIndex: 1,
                child: PortfolioDetailsSection(),
              ),
              SliverInfoSection(
                sectionIndex: 1,
                child: PortfolioInfoSection(),
              ),
              SliverDetailsSection(
                sectionIndex: 2,
                child: BlogDetailsSection(),
              ),
              SliverInfoSection(
                sectionIndex: 2,
                child: BlogInfoSection(),
              ),
              SliverDetailsSection(
                sectionIndex: 3,
                child: JobDetailsSection(),
              ),
              SliverInfoSection(
                sectionIndex: 3,
                child: JobInfoSection(),
              ),
              SliverToBoxAdapter(
                child: FooterSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDetailsSection extends StatelessWidget {
  const SliverDetailsSection({
    required this.child,
    this.sectionIndex = 0,
  });

  final Widget child;
  final int sectionIndex;

  @override
  Widget build(BuildContext context) {
    double scrollOffset =
        context.watch<HomePageProvider>().mobileViewScrollControllerOffset;

    double opacityOffset =
        scrollOffset - kToolbarHeight - (kScreenHeight(context) * sectionIndex);

    return SliverPersistentHeader(
      pinned: true,
      delegate: PersistentHeaderDelegate(
        minHeight: 0.0,
        maxHeight: kScreenHeight(context) * 0.6,
        child: Opacity(
          opacity: (1 - opacityOffset / (kScreenHeight(context) * 0.6))
              .clamp(0.0, 1.0),
          child: Container(
            height: kScreenHeight(context) * 0.6,
            child: child,
          ),
        ),
      ),
    );
  }
}

class SliverInfoSection extends StatelessWidget {
  const SliverInfoSection({
    required this.child,
    this.sectionIndex = 0,
  });

  final Widget child;
  final int sectionIndex;

  @override
  Widget build(BuildContext context) {
    double scrollOffset =
        context.watch<HomePageProvider>().mobileViewScrollControllerOffset;

    double opacityOffset = scrollOffset -
        kToolbarHeight -
        (kScreenHeight(context) * 0.4) -
        (kScreenHeight(context) * sectionIndex);

    return SliverToBoxAdapter(
      child: Opacity(
        opacity: (1 - opacityOffset / (kScreenHeight(context) * 0.4))
            .clamp(0.0, 1.0),
        child: Container(
          height: kScreenHeight(context) * 0.4,
          child: FittedBox(
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
