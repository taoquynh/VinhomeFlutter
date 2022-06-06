import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color.dart';

class VinTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final String? labelText;
  final String? hintText;
  final bool autoFocus;
  final bool obscureText;
  final bool enable;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final int minLines;
  final int maxLines;
  final TextAlign textAlign;
  final double? letterSpacing;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final EdgeInsets? contentPadding;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;

  const VinTextField({
    Key? key,
    this.controller,
    this.autoFocus = false,
    this.obscureText = false,
    this.enable = true,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.labelText,
    this.hintText,
    this.inputFormatters,
    this.minLines = 1,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.backgroundColor,
    this.contentPadding,
    this.textInputAction,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(
          color: AppColor.grayColor,
        ),
        hintStyle: TextStyle(
          color: AppColor.grayColor,
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 10),
        border: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColor.grayColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColor.grayColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColor.mainColor, width: 1),
        ),
      ),
      cursorColor: AppColor.mainColor,
    );
  }
}
