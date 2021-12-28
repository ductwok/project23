import 'package:docbaorss/src/data/data.dart';
import 'package:docbaorss/src/data/models/rss_model.dart';
import 'package:docbaorss/src/service/rss_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    Key? key,
    required this.rss,
  }) : super(key: key);

  final RssModel rss;

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late RssModel _rss;

  @override
  void initState() {
    super.initState();
    _rss = widget.rss;
    _fetchData();
  }

  var _isLoading = true;

  void _fetchData() async {
    try {
      if (_rss.detail == null) {
        _rss = await RssService.fetchDetail(_rss);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    late Widget _child;
    if (_isLoading) {
      _child = const Center(child: CupertinoActivityIndicator());
    } else {
      _child = SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Text(
            _rss.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 20),
          Text(
            _rss.detail?.detail ?? '',
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 16, wordSpacing: 2),
          ),
          if (_rss.image.isNotEmpty)
            Image.network(
              _rss.image,
              cacheHeight: 500,
              cacheWidth: 500,
              errorBuilder: (a, b, c) {
                return const Center(child: Text('No Image'));
              },
            ),
        ]),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Detail'), actions: [
        TextButton(
          child: const Icon(Icons.share, color: Colors.white),
          onPressed: _isLoading
              ? null
              : () async {
                  await Share.share(_rss.detail?.detail ?? '',
                      subject: _rss.title);
                },
        ),
        TextButton(
          child: const Icon(Icons.save, color: Colors.white),
          onPressed: _isLoading
              ? null
              : () async {
                  await AppData().saveRss(_rss);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Saved!'),
                  ));
                },
        ),
      ]),
      body: _child,
    );
  }
}
