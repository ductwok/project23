import 'package:docbaorss/src/base/nav.dart';
import 'package:docbaorss/src/data/data.dart';
import 'package:docbaorss/src/data/models/rss_model.dart';
import 'package:docbaorss/src/ui/pages/news_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:docbaorss/src/service/rss_service.dart';

class NewsView extends StatefulWidget {
  const NewsView({
    Key? key,
    required this.url,
    this.isSaved = false,
  }) : super(key: key);

  final String url;
  final bool isSaved;

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
    _fetchRss();
  }

  var _isLoading = true;
  final _data = <RssModel>[];

  void _fetchRss() async {
    try {
      if (widget.isSaved) {
        _data.addAll(AppData().getSavedRss());
      } else {
        _data.addAll(await RssService.fetchRss(widget.url));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CupertinoActivityIndicator());
    }
    if (_data.isEmpty) {
      if (widget.isSaved) {
        return const Center(child: Text('No Data Saved'));
      } else {
        return const Center(child: Text('Data loading failed'));
      }
    }
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (ctx, index) {
        final _e = _data[index];
        return GestureDetector(
          onTap: () {
            navigateTo(context, NewsDetailPage(rss: _e));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 4)],
            ),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Row(children: [
              SizedBox(
                width: 100,
                child: _e.image.isNotEmpty
                    ? Image.network(
                        _e.image,
                        cacheHeight: 500,
                        cacheWidth: 500,
                        errorBuilder: (a, b, c) {
                          return const Center(child: Text('No Image'));
                        },
                      )
                    : const Center(child: Text('No Image')),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _e.title,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
