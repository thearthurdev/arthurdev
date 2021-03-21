import 'package:arthurdev/providers/home_page_provider.dart';
import 'package:arthurdev/sections/blog_section_left.dart';
import 'package:arthurdev/sections/blog_section_right.dart';
import 'package:arthurdev/sections/footer_section.dart';
import 'package:arthurdev/sections/intro_details_section.dart';
import 'package:arthurdev/sections/intro_info_section.dart';
import 'package:arthurdev/sections/job_section_left.dart';
import 'package:arthurdev/sections/job_section_right.dart';
import 'package:arthurdev/sections/portfolio_section_left.dart';
import 'package:arthurdev/sections/portfolio_section_right.dart';
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
  ScrollController _scrollController;
  double _scrollControllerExtentBefore;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollControllerExtentBefore = 0.0;
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

      context.read<HomePageProvider>().changeCurrentSection(_scrollController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                backgroundColor: kPrimaryColorDark,
                title: ArthurDevBanner(scrollController: _scrollController),
                floating: true,
                pinned: false,
                actions: [
                  NavigationMenu(
                    scrollController: _scrollController,
                  ),
                ],
              ),
              SliverDetailsSection(
                child: IntroDetailsSection(),
              ),
              SliverInfoSection(
                child: IntroInfoSection(),
              ),
              SliverDetailsSection(
                // sectionKey: kPortfolioSectionKey,
                child: PortfolioSectionTop(),
              ),
              SliverInfoSection(
                child: PortfolioSectionBottom(),
              ),
              SliverDetailsSection(
                // sectionKey: kBlogSectionKey,
                child: BlogSectionTop(),
              ),
              SliverInfoSection(
                child: BlogSectionBottom(),
              ),
              SliverDetailsSection(
                // sectionKey: kJobSectionKey,
                child: JobSectionTop(),
              ),
              SliverInfoSection(
                child: JobSectionBottom(),
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
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: PersistentHeaderDelegate(
        minHeight: 0.0,
        maxHeight: kScreenHeight(context) * 0.6,
        child: Container(
          height: kScreenHeight(context) * 0.6,
          child: child,
        ),
      ),
    );
  }
}

class SliverInfoSection extends StatelessWidget {
  const SliverInfoSection({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: kScreenHeight(context) * 0.4,
        child: child,
      ),
    );
  }
}

class PortfolioSectionTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortfolioSectionLeft();
  }
}

class PortfolioSectionBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortfolioSectionRight();
  }
}

class BlogSectionTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlogSectionLeft();
  }
}

class BlogSectionBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlogSectionRight();
  }
}

class JobSectionTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JobSectionLeft();
  }
}

class JobSectionBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JobSectionRight();
  }
}
