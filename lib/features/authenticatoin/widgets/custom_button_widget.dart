import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CutomButton extends StatelessWidget {
  CutomButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.icon,
    required this.width,
    required this.onPressed
  });

  String? text;
  Color? bgColor;
  Color? textColor;
  Icon? icon;
  VoidCallback? onPressed;
  double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width!,
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: bgColor!,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Text(
              text!,
              style: TextStyle(
                color: textColor!,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ).tr(),
            icon != null ? const SizedBox(width: 8) : const SizedBox(),
            icon != null ? icon as Widget : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
