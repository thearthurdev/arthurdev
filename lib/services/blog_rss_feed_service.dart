import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class RssFeedService {
  static Uri _feedUrl = Uri.https('arthur.hashnode.dev', 'rss.xml');

  static RssFeed _feed;

  static get feed => _feed;

  static Future<RssFeed> _getFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(_feedUrl);

      print(response.body);
      return RssFeed.parse(response.body);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future loadFeed() async {
    _getFeed().then((result) {
      if (result == null || result.toString().isEmpty) {
        return;
      }

      _feed = result;
      print('200');
    });
  }
}
