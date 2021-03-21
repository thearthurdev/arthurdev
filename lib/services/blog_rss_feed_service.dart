import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class RssFeedService {
  static RssFeed _feed;

  static get feed => _feed;

  static Future<RssFeed> _getFeed() async {
    final _authority = "thearthur.hashnode.dev";
    final _path = "rss.xml";
    final _feedUri = Uri.https(_authority, _path);

    print(_feedUri.toString());

    try {
      final client = http.Client();
      final response = await client.get(_feedUri);

      print(response.body);

      return RssFeed.parse(response.body);
    } catch (e) {
      print('error: $e');
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
