import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class FlightInfo extends StatelessWidget {
  const FlightInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Wed, OCT 26 2022",
              style: TextStyle(color: AppColors.textGray, fontSize: 14),
            ),
            Text(
              "New York, USA",
              style: TextStyle(color: AppColors.textBlack, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "(LGA)",
              style: TextStyle(color: AppColors.textGray, fontSize: 14),
            ),
          ],
        ),
        const Icon(Icons.flight, color: AppColors.blue, size: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              "9:37 PM",
              style: TextStyle(color: AppColors.textGray, fontSize: 14),
            ),
            Text(
              "Danang, VIE",
              style: TextStyle(color: AppColors.textBlack, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "(DAD)",
              style: TextStyle(color: AppColors.textGray, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
