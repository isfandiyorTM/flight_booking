import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../helpers/helper_functions.dart';

class AuthentificationButton extends StatelessWidget {
  AuthentificationButton({
    super.key,
    required this.icon,
  });

  Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: HelperFunctions.screenWidth() * 0.25,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.bgLight,
        ),
        child: icon,
      ),
    );
  }
}
