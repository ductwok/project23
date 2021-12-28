import 'package:docbaorss/src/base/const.dart';
import 'package:docbaorss/src/data/data.dart';
import 'package:docbaorss/src/service/firebase_auth_service.dart';
import 'package:docbaorss/src/ui/pages/home_page.dart';
import 'package:docbaorss/src/ui/pages/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocBaoApp extends MaterialApp {
  DocBaoApp({Key? key})
      : super(
          key: key,
          title: 'Doc Bao Online',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: kPrimaryColor),
            cupertinoOverrideTheme:
                const CupertinoThemeData(primaryColor: kPrimaryColor),
            textSelectionTheme: const TextSelectionThemeData(
                selectionHandleColor: Colors.white),
            // accentColor: kPrimaryColor,
            primaryColor: kPrimaryColor,
          ),
          home: FirebaseAuthService.isSignIn
              ? const HomePage()
              : const SignInPage(),
        );

  static Future<void> initiate() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await AppData.initialize();
    // await FirebaseAuthService.signOut();
  }
}
