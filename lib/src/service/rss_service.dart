import 'package:docbaorss/src/data/models/rss_model.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';
import 'package:html/parser.dart' show parse;

abstract class RssService {
  static Future<List<RssModel>> fetchRss(String url) async {
    try {
      final _response = await http.get(Uri.parse(url));
      if (_response.statusCode != 200) {
        throw ('Internet Connection Error');
      }
      final _rss = RssFeed.parse(_response.body);
      return _rss.items?.map<RssModel>((e) {
            late String _image;
            try {
              var _d =
                  e.description!.substring(e.description!.indexOf('src=') + 5);
              _image = _d.substring(0, _d.indexOf('"'));
            } catch (e) {
              _image = '';
            }
            return RssModel(
              image: _image,
              title: e.title ?? '',
              link: e.link ?? '',
            );
          }).toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  static Future<RssModel> fetchDetail(RssModel rss) async {
    // static Future fetchDetail(String url) async {
    try {
      final _response = await http.get(Uri.parse(rss.link));
      if (_response.statusCode != 200) {
        throw ('Internet Connection Error');
      }
      var _html = parse(_response.body);
      // print('Title');
      // print(_html.getElementsByTagName('h1').first.text);
      // print('Description');
      // print(_html.getElementsByTagName('h2').length);
      // print('Article');
      // print(_html.getElementsByTagName('article').first.text);
      rss.detail = RssDetail(
        detail: _html.getElementsByTagName('article').first.text,
        title: rss.title,
        image: rss.image,
      );
      return rss;
    } catch (e) {
      rethrow;
    }
  }
}
