import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart'; // Assuming AppColors is here
import 'package:easy_localization/easy_localization.dart';

class SelectDateWidget extends StatefulWidget {
  final TextEditingController dateController;

  const SelectDateWidget({super.key, required this.dateController});

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Date',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textBlack,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Calendar Picker
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColors.blue,
                  onPrimary: AppColors.white,
                  onSurface: AppColors.textBlack,
                ),
              ),
              child: CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: DateTime(2025),
                lastDate: DateTime(2030),
                currentDate: DateTime.now(),
                onDateChanged: (DateTime selectedDate) {
                  setState(() {
                    _selectedDate = selectedDate;
                    widget.dateController.text =
                    _selectedDate.toString().split(' ')[0];
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.blue,
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  AppTexts.searchDate,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ).tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}