import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class SelectedSeatInfo extends StatelessWidget {
  final String selectedSeat;

  const SelectedSeatInfo({Key? key, required this.selectedSeat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selectedSeat.isNotEmpty ? "Selected Seat: #1 $selectedSeat" : "Please select a seat",
          style: const TextStyle(color: AppColors.textBlack, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
