import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget page, [bool replace = false]) {
  Function navigator;

  if (replace) {
    navigator = Navigator.of(context).pushReplacement;
  } else {
    navigator = Navigator.of(context).push;
  }

  navigator(MaterialPageRoute(builder: (context) => page));
}

void navigateRemoveUntil(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil<dynamic>(
    context,
    MaterialPageRoute<dynamic>(builder: (BuildContext con) => page),
        (route) => false,
  );
}
