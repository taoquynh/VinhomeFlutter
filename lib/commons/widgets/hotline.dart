import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vinhome/utils/color.dart';

class VinHotline extends StatelessWidget {
  final GestureTapCallback? onTapped;
  const VinHotline({Key? key, this.onTapped}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: 'HotLine: ', style: TextStyle(color: AppColor.blackColor)),
        TextSpan(
          text: '1800.1186',
          style: TextStyle(color: AppColor.mainColor),
          recognizer: TapGestureRecognizer()..onTap = onTapped,
        )
      ]),
    );
  }
}
