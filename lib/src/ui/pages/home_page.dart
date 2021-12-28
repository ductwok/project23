import 'package:docbaorss/src/base/const.dart';
import 'package:docbaorss/src/base/nav.dart';
import 'package:docbaorss/src/service/firebase_auth_service.dart';
import 'package:docbaorss/src/ui/pages/news_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang Chu')),
      drawer: Drawer(
        child: Column(children: [
          Container(
            height: 150,
            alignment: Alignment.bottomLeft,
            child: Text(
              FirebaseAuthService.email,
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
            color: kPrimaryColor,
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () {
              navigateTo(context, const NewsPage(url: '', isSaved: true));
            },
            title: const Text('Saved'),
            leading: const Icon(Icons.folder_special_outlined),
          ),
        ]),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              _buildContainer(
                text: 'VNExpress',
                url: '',
                image: 'assets/images/vn.png',
                isVn: true,
              ),
              const SizedBox(width: 20),
              _buildContainer(
                text: 'DanTri',
                url: kDantri,
                image: 'assets/images/dantri.png',
              ),
            ], mainAxisAlignment: MainAxisAlignment.center),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              _buildContainer(
                text: '24H',
                url: k24H,
                image: 'assets/images/h24.png',
              ),
              const SizedBox(width: 20),
              _buildContainer(
                text: 'Vietnamnet',
                url: kVietNameNet,
                image: 'assets/images/viet.png',
              ),
            ], mainAxisAlignment: MainAxisAlignment.center),
          ),
        ]),
      ),
    );
  }

  Widget _buildContainer({
    required String text,
    required String url,
    required String image,
    bool isVn = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          navigateTo(context, NewsPage(url: k24H, isVn: isVn));
        },
        child: Container(
          child: Column(children: [
            Image.asset(image, height: 50, width: 50),
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 10),
            ],
          ),
        ),
      ),
    );
  }
}
