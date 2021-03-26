import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/blog_post_listtile.dart';
import 'package:arthurdev/widgets/hashnode_logo.dart';
import 'package:flutter/material.dart';

class BlogDetailsSection extends StatelessWidget {
  final Map<String, String> blogPosts = {
    'Jan 31': 'Recreating the iconic Star Wars Intro in Flutter',
    'Jan 14': 'How to Migrate your WhatsApp Chats to Telegram',
    'Jul 29': 'scrcpy - Mirror Your Device\'s Screen! (Linux Edition)',
  };

  @override
  Widget build(BuildContext context) {
    return kIsDesktop(context)
        ? _buildDesktopView(context)
        : _buildMobileView(context);
  }

  Widget _buildDesktopView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColorLight1,
            kPrimaryColorLight2,
          ],
        ),
      ),
      padding: EdgeInsets.only(
        bottom: kScreenHeightAwareSize(40.0, context),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -10.0,
            left: -15.0,
            child: HashnodeLogo(),
          ),
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 560.0,
                minWidth: 300.0,
              ),
              margin: EdgeInsets.all(24.0),
              child: buildBlogPostsListView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return Container(
      key: kBlogSectionKey,
      color: kPrimaryColorLight1,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topRight,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       kPrimaryColorLight1,
      //       kPrimaryColorLight2,
      //     ],
      //   ),
      // ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: kScreenHeight(context) * 0.6,
          child: Stack(
            children: [
              Positioned(
                top: -100.0,
                right: -80.0,
                child: HashnodeLogo(size: 400.0),
              ),
              Center(
                child: FittedBox(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 560.0,
                      minWidth: 300.0,
                    ),
                    margin: EdgeInsets.all(24.0),
                    child: buildBlogPostsListView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildBlogPostsListView() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: blogPosts.length,
      itemBuilder: (context, i) {
        return BlogPostListTile(
          date: blogPosts.keys.elementAt(i),
          title: blogPosts.values.elementAt(i),
          url: kBlogPostURLs[i],
        );
      },
      separatorBuilder: (context, i) {
        return Container(
          height: 1.0,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          color: kDividerColor,
        );
      },
    );
  }
}
