import 'package:docbaorss/src/data/models/rss_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

mixin RssMixin {
  static late Box<RssModel> _box;

  static Future<void> initiate() async {
    _box = await Hive.openBox<RssModel>('offlineRss');
  }

  Future<void> saveRss(RssModel rss) async {
    _box.add(rss);
    await rss.save();
  }

  List<RssModel> getSavedRss() {
    return _box.values.toList();
  }
}
