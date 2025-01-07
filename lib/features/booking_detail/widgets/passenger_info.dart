import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import '../passenger_info.dart';
import 'custom_button.dart';
import 'package:easy_localization/easy_localization.dart';

class PassengerInfo extends StatefulWidget {
  const PassengerInfo({super.key});

  @override
  State<PassengerInfo> createState() => _PassengerInfoState();
}

class _PassengerInfoState extends State<PassengerInfo> {
  bool _sameAsContact = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Same As Contact Details Box
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTexts.sameContact.tr(),
                style: const TextStyle(
                  color: AppColors.textBlack,
                  fontSize: 16,
                ),
              ),
              Switch(
                value: _sameAsContact,
                onChanged: (value) {
                  setState(() {
                    _sameAsContact = value;
                  });
                },
                activeColor: AppColors.switchActiveThumb,
                activeTrackColor: AppColors.switchActiveTrack,
                inactiveThumbColor: AppColors.switchInactiveThumb,
                inactiveTrackColor: AppColors.switchInactiveTrack,
              ),
            ],
          ),
        ),
        // Selena Kayle Box
        GestureDetector(
          onTap: () {},
          child: CustomButton(
            label: AppTexts.selena.tr(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PassengerInfoPage()),
              );
            },
          ),
        ),
      ],
    );
  }
}
