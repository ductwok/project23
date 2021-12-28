import 'package:docbaorss/src/base/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextInputType textInputType;
  final IconData iconData;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final String initialValue;
  final TextInputAction textInputAction;

  const AppTextField({
    Key? key,
    required this.iconData,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.go,
    required this.onSaved,
    required this.labelText,
    this.hintText,
    required this.validator,
    this.maxLines = 1,
    this.initialValue = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        onSaved: onSaved,
        validator: validator,
        maxLines: maxLines,
        decoration: kInputDecoration.copyWith(
          labelText: labelText,
          hintText: hintText ?? labelText,
          prefixIcon: Icon(iconData),
        ),
      ),
    );
  }
}

class AppPasswordField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onChanged;

  const AppPasswordField({
    Key? key,
    required this.onSaved,
    required this.labelText,
    this.hintText,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  _AppPasswordFieldState createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        obscureText: _show,
        keyboardType: TextInputType.text,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onChanged: widget.onChanged,
        decoration: kInputDecoration.copyWith(
          labelText: widget.labelText,
          hintText: widget.hintText ?? widget.labelText,
          prefixIcon: const Icon(CupertinoIcons.lock),
          suffixIcon: InkWell(
            onTap: () => setState(() => _show = !_show),
            child: Icon(_show ? CupertinoIcons.eye_slash : CupertinoIcons.eye),
          ),
        ),
      ),
    );
  }
}
