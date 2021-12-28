import 'package:docbaorss/src/base/const.dart';
import 'package:docbaorss/src/ui/views/news_view.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({
    Key? key,
    required this.url,
    this.isVn = false,
    this.isSaved = false,
  }) : super(key: key);

  final String url;
  final bool isVn;
  final bool isSaved;

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: kVnExpress.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    late Widget _body;
    late AppBar _appBar;
    if (widget.isVn) {
      _appBar = AppBar(
        title: const Text('Danh muc bao'),
        bottom: TabBar(
          controller: _tabController,
          // indicatorColor: Colors.grey,
          // labelColor: Colors.black,
          // labelStyle: TextStyle(fontSize: 16, color: Colors.white),
          // unselectedLabelColor: Colors.grey,
          isScrollable: true,
          tabs: kVnExpress.keys.map<Widget>(
            (e) {
              return Container(
                padding: const EdgeInsets.fromLTRB(1, 1, 1, 3),
                child: Text(
                  e,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              );
            },
          ).toList(),
        ),
      );
      _body = TabBarView(
        controller: _tabController,
        children:
            kVnExpress.values.map<Widget>((e) => NewsView(url: e)).toList(),
      );
    } else {
      _appBar = AppBar(
        title: Text(widget.isSaved ? 'Saved' : 'Danh muc bao'),
      );
      _body = NewsView(url: widget.url, isSaved: widget.isSaved);
    }
    return Scaffold(appBar: _appBar, body: _body);
  }
}
