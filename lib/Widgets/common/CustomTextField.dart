import 'dart:core';

import 'package:flutter/material.dart';
import 'package:my_wedding_web/Values/MyColors.dart';

import '../../../base/BaseStateless.dart';

class CustomTextField extends BaseStateless {
  final String label;
  final String hint;
  final int? minLines;
  final int? maxLines;
  final bool expands;
  final ValueChanged<String> onChanged;
  final bool optional;

  CustomTextField(this.onChanged,
      {super.key,
      required this.label,
      required this.hint,
      required this.minLines,
      required this.maxLines,
      required this.expands,
      required this.optional});

  @override
  Widget build(BuildContext context) {
    init(context);
    return TextField(
      onChanged: (value) => onChanged(value),
      // expands: expands,
      minLines: minLines,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        filled: true,
        label: Text(
          label,
          softWrap: false,
          style: TextStyle(color: secondaryColor),
        ),
        hintText: hint,
        hintStyle: TextStyle(fontSize: responsiveApp.bodyText1, overflow: TextOverflow.clip),
        helperText: optional ? "Optional" : null,
        border: OutlineInputBorder(borderSide: BorderSide(color: secondaryColor, width: 2)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: secondaryColor, width: 2)),
        alignLabelWithHint: true,
        fillColor: Colors.transparent,
        focusColor: Colors.black,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
