import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'widgets/gender_selection.dart';
import 'widgets/input_field.dart';
import 'widgets/save_button.dart';

class PassengerInfoPage extends StatefulWidget {
  const PassengerInfoPage({Key? key}) : super(key: key);

  @override
  State<PassengerInfoPage> createState() => _PassengerInfoPageState();
}

class _PassengerInfoPageState extends State<PassengerInfoPage> {
  String _gender = "Male"; // Default gender selection
  final TextEditingController _nameController =
  TextEditingController(text: "Cameron Williamson");
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
          icon: const Icon(Icons.arrow_back, color: AppColors.textBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Passenger Info",
          style: TextStyle(
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
              label: "Full Name",
              controller: _nameController,
            ),
            const SizedBox(height: 16),

            // ID Card Number Input
            InputField(
              label: "ID card number",
              controller: _idNumberController,
            ),
            const SizedBox(height: 16),

            // Info Text
            const Text(
              "This contact is for e-ticket and refund/rescheduling",
              style: TextStyle(
                color: AppColors.textGray,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 32),

            // Save Changes Button
            SaveButton(onPressed: () {
              Navigator.pop(context); // Go back to the previous page
            }),
          ],
        ),
      ),
    );
  }
}
