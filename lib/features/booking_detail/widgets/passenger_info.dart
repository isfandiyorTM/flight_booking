import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../passenger_info.dart';
import 'custom_button.dart';

class PassengerInfo extends StatefulWidget {
  const PassengerInfo({Key? key}) : super(key: key);

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
          margin: const EdgeInsets.only(bottom: 16), // Adds spacing between boxes
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Same As Contact Details",
                style: TextStyle(
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
          onTap: () {

          },
          child: CustomButton(
            label: "Selena Kayle",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PassengerInfoPage()),
              );
            },
          ),


        ),
      ],
    );
  }
}
