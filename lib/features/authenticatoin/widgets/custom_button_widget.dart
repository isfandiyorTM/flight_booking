import 'package:flutter/material.dart';

import '../../../helpers/helper_functions.dart';

class CutomButton extends StatelessWidget {
  CutomButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.icon,
    required this.onPressed
  });

  String? text;
  Color? bgColor;
  Color? textColor;
  Icon? icon;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: HelperFunctions.screenWidth() * 0.4,
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: bgColor!,
            padding: const EdgeInsets.symmetric(horizontal:45,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Row(
          mainAxisAlignment: icon == null ? MainAxisAlignment.center : MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text!,
              style: TextStyle(
                color: textColor!,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            icon != null ? icon as Widget : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
