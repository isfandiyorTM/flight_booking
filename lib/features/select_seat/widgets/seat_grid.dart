import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class SeatGrid extends StatelessWidget {
  final ValueChanged<String> onSeatSelected;

  const SeatGrid({Key? key, required this.onSeatSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define seat arrangement and status
    final int rows = 8;
    final List<String> columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Header with columns A to G
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: columns.map((col) {
            return Expanded(
              child: Center(
                child: Text(
                  col,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBlack,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),

        // Seat rows
        Expanded(
          child: ListView.builder(
            itemCount: rows,
            itemBuilder: (context, rowIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Row number
                    Text(
                      (rowIndex + 1).toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textGray,
                      ),
                    ),
                    // Seats in each row
                    ...columns.map((col) {
                      // Logic to determine seat availability (example logic)
                      final isAvailable = (rowIndex + col.codeUnitAt(0)) % 2 == 0;
                      final isSelected = col == 'C' && rowIndex == 2; // Example for selected seat
                      final seatKey = "$col${rowIndex + 1}";

                      return Expanded(
                        child: GestureDetector(
                          onTap: isAvailable
                              ? () => onSeatSelected(seatKey)
                              : null, // Only trigger callback if seat is available
                          child: _buildSeat(isAvailable, isSelected),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Builds individual seat widget
  Widget _buildSeat(bool isAvailable, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 40,
      height: 32, // Oval shape
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.blue
            : isAvailable
            ? AppColors.bgLight
            : Colors.transparent,
        border: isAvailable && !isSelected
            ? Border.all(color: AppColors.blue)
            : null,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16), // Makes it oval
      ),
      child: isSelected
          ? const Icon(Icons.check, color: AppColors.white, size: 16)
          : null,
    );
  }
}
