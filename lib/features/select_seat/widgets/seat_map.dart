import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart'; // AppTexts klassini import qiling
import 'package:easy_localization/easy_localization.dart'; // EasyLocalization import

class SeatMap extends StatelessWidget {
  final List<List<int>> seatStatus;
  final Function(int, int) onSeatTapped;

  const SeatMap({
    super.key,
    required this.seatStatus,
    required this.onSeatTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.seatMap,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top row with column labels (A to G)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                7,
                    (index) => Expanded(
                  child: Text(
                    String.fromCharCode(65 + index),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.textGray,
                    ),
                  ),
                ),
              ),
            ),

            // Seat grid
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: seatStatus.length,
                itemBuilder: (context, rowIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        seatStatus[rowIndex].length,
                            (colIndex) {
                          if (colIndex == 3) {
                            return Expanded(
                              child: Center(
                                child: Text(
                                  (rowIndex + 1).toString(),
                                  style: const TextStyle(
                                    color: AppColors.textBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }

                          // For unavailable seats (status == 0)
                          if (seatStatus[rowIndex][colIndex] == 0) {
                            return Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(4.0),
                                width: 50,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.seatBg,
                                  ),
                                ),
                              ),
                            );
                          }

                          // For available or selected seats
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                onSeatTapped(rowIndex, colIndex);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4.0),
                                width: 50,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: seatStatus[rowIndex][colIndex] == 1
                                      ? AppColors.seatBg
                                      : AppColors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.blue,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: seatStatus[rowIndex][colIndex] == 2
                                      ? const Icon(
                                    Icons.check,
                                    color: AppColors.white,
                                  )
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // Legend
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Selected
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.blue,
                        child: Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppTexts.selected.tr(), // "SELECTED"
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ],
                  ),
                  // Available
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.seatBg,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppTexts.available.tr(), // "AVAILABLE"
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ],
                  ),
                  // Not Available
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.lightGray,
                        child: Icon(
                          Icons.close,
                          color: AppColors.textGray,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppTexts.notAvailable.tr(), // "NOT AVAILABLE"
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textBlack,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
