import 'package:arthurdev/utils/consts.dart';
import 'package:arthurdev/utils/responsive_view_util.dart';
import 'package:arthurdev/widgets/blog_post_listtile.dart';
import 'package:arthurdev/widgets/hashnode_logo.dart';
import 'package:flutter/material.dart';

class BlogSectionLeft extends StatelessWidget {
  const BlogSectionLeft({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> blogPosts = {
      'Jan 31': 'Recreating the iconic Star Wars Intro in Flutter',
      'Jan 14': 'How to Migrate your WhatsApp Chats to Telegram',
      'Jul 29': 'scrcpy - Mirror Your Device\'s Screen! (Linux Edition)',
    };

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
      padding: EdgeInsets.only(bottom: kScreenHeightAwareSize(40.0, context)),
      // child: FutureBuilder(
      //     future: RssFeedService.loadFeed(),
      //     builder: (context, snapshot) {
      //       RssFeed feed = snapshot.data;

      //       if (snapshot.connectionState != ConnectionState.done) {
      //         return Container(
      //           height: 200.0,
      //           width: 200.0,
      //           child: Center(
      //             child: CircularProgressIndicator(),
      //           ),
      //         );
      //       }

      //       if (snapshot.data == null) {
      //         return Container(
      //           width: 200.0,
      //           height: 200.0,
      //           child: Center(
      //             child: Text(
      //               'Unable to load blog feed',
      //               style: kSectionInfoTextStyle,
      //             ),
      //           ),
      //         );
      //       }

      //       return Flexible(
      //         child: Container(
      //           width: 560.0,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: List.generate(
      //               feed.items.length,
      //               (i) => BlogPostListTile(
      //                 date: feed.items[i].pubDate.toString(),
      //                 title: feed.items[i].title,
      //               ),
      //             ),
      //           ),
      //         ),
      //       );
      //     }),

      child: Stack(
        children: [
          Positioned(
            top: -10.0,
            left: -15.0,
            child: HashnodeLogo(),
          ),
          Center(
            child: Container(
              width: 560.0,
              margin: EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  blogPosts.length,
                  (i) => BlogPostListTile(
                    date: blogPosts.keys.elementAt(i),
                    title: blogPosts.values.elementAt(i),
                    url: kBlogPostURLs[i],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
