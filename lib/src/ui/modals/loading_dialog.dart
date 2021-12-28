import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

$showLoadingDialog(BuildContext context, String text) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.all(50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            width: 35,
            height: 35,
            child: CupertinoActivityIndicator(),
          ),
          const SizedBox(height: 15),
          Text(text + "...")
        ],
      ),
    ),
  );
}
