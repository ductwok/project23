import 'package:docbaorss/src/base/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

$showErrorDialog(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (ctx) => _ErrorDialog(error: error),
  );
}

class _ErrorDialog extends StatefulWidget {
  const _ErrorDialog({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<_ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Column(children: [
        Text(
          widget.error,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            child: const Text('Ok'),
            onPressed: Navigator.of(context).pop,
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        )
      ], mainAxisSize: MainAxisSize.min),
    );
  }
}
