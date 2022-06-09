import 'package:flutter/material.dart';
import 'package:vinhome/commons/widgets/fill_button.dart';
import 'package:vinhome/utils/color.dart';

import 'dialog_manager.dart';

void showAlertDialog({
  required BuildContext context,
  String? title,
  required String message,
  bool barrierDismissible = true,
  Function? onDone,
}) {
  DialogManager.show(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return _Dialog(
        title: title,
        message: message,
        onDone: onDone,
      );
    },
  );
}

class _Dialog extends StatelessWidget {
  final String? title;
  final String message;
  final Function? onDone;

  const _Dialog({Key? key, this.title, required this.message, this.onDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? 'Vinhome',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 16,
          ),
          FillButton(
            onPress: () {
              if (onDone != null) {
                onDone!();
              } else {
                Navigator.of(context).pop();
              }
            },
            title: 'Đóng',
            textStyle: const TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
