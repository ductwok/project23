import 'package:hive/hive.dart';

part 'rss_model.g.dart';

@HiveType(typeId: 0)
class RssModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String link;
  @HiveField(3)
  RssDetail? detail;

  RssModel({
    required this.image,
    required this.title,
    required this.link,
    this.detail,
  });
}

@HiveType(typeId: 1)
class RssDetail extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String detail;

  RssDetail({
    required this.detail,
    required this.title,
    required this.image,
  });
}
