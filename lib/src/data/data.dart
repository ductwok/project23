import 'package:docbaorss/src/data/models/rss_model.dart';
import 'package:docbaorss/src/data/rss_mixin.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppData with RssMixin {
  static Future initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RssModelAdapter());
    Hive.registerAdapter(RssDetailAdapter());
    await RssMixin.initiate();
  }
}
