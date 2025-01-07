import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../core/constants/text_strings.dart';
import 'widgets/gender_selection.dart';
import 'widgets/input_field.dart';
import 'widgets/save_button.dart';
import 'package:easy_localization/easy_localization.dart';

class PassengerInfoPage extends StatefulWidget {
  const PassengerInfoPage({Key? key}) : super(key: key);

  @override
  State<PassengerInfoPage> createState() => _PassengerInfoPageState();
}

class _PassengerInfoPageState extends State<PassengerInfoPage> {
  String _gender = AppTexts.male.tr(); // Default gender selection
  final TextEditingController _nameController =
  TextEditingController(text: AppTexts.cameronWilliamson.tr());
  final TextEditingController _idNumberController =
  TextEditingController(text: "12867358234523");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: AppColors.textBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          AppTexts.passengerInfo.tr(),
          style: const TextStyle(
            color: AppColors.textBlack,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gender Selection
            GenderSelection(
              gender: _gender,
              onGenderChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Full Name Input
            InputField(
              label: AppTexts.fullName.tr(),
              controller: _nameController,
            ),
            const SizedBox(height: 16),

            // ID Card Number Input
            InputField(
              label:AppTexts.idCard.tr(),
              controller: _idNumberController,
            ),
            const SizedBox(height: 16),

            // Info Text
             Text(
              AppTexts.rescheduling.tr(),
              style: const TextStyle(
                color: AppColors.textGray,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 32),

            // Save Changes Button
            SaveButton(onPressed: () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
