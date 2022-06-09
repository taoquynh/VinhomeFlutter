import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinhome/utils/color.dart';

class FillButton extends StatelessWidget {
  final void Function() onPress;
  final String title;
  final TextStyle? textStyle;
  final EdgeInsets? buttonPadding;
  const FillButton(
      {Key? key,
      required this.onPress,
      required this.title,
      this.textStyle,
      this.buttonPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: AppColor.mainColor,
        padding: buttonPadding,
      ),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
