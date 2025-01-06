import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class SeatLegend extends StatelessWidget {
  const SeatLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLegend("Selected", AppColors.blue, isFilled: true),
        _buildLegend("Available", AppColors.blue),
        _buildLegend("Not Available", Colors.grey),
      ],
    );
  }

  Widget _buildLegend(String label, Color color, {bool isFilled = false}) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: isFilled ? color : Colors.transparent,
            border: Border.all(color: color),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: AppColors.textBlack, fontSize: 14)),
      ],
    );
  }
}
