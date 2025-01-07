import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_strings.dart';
import 'widgets/gender_selection.dart';
import 'widgets/input_field.dart';
import 'widgets/country_code_dropdown.dart';
import 'widgets/save_button.dart';
import 'widgets/info_text.dart';
import 'package:easy_localization/easy_localization.dart';
class ContactPersonDetailPage extends StatefulWidget {
  const ContactPersonDetailPage({super.key});

  @override
  State<ContactPersonDetailPage> createState() => _ContactPersonDetailPageState();
}

class _ContactPersonDetailPageState extends State<ContactPersonDetailPage> {
  String _gender = AppTexts.male.tr(); // Default gender
  final TextEditingController _nameController =
  TextEditingController(text: AppTexts.cameronWilliamson.tr());
  final TextEditingController _emailController =
  TextEditingController(text: AppTexts.williamsonEmail .tr());
  final TextEditingController _phoneController =
  TextEditingController(text: "1234416131");
  final TextEditingController _idController =
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
          AppTexts.contactDetails.tr(),
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
            GenderSelection(
              gender: _gender,
              onGenderChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            const SizedBox(height: 16),
            InputField(label:  AppTexts.fullName.tr(), controller: _nameController),
            const SizedBox(height: 16),
            InputField(label: AppTexts.email.tr(), controller: _emailController),
            const SizedBox(height: 16),
            const CountryCodeDropdown(),
            const SizedBox(height: 16),
            InputField(label: AppTexts.phoneNumberDefault.tr(), controller: _phoneController),
            const SizedBox(height: 16),
            InputField(label: AppTexts.idCard.tr(), controller: _idController),
            const SizedBox(height: 16),
            const InfoText(),
            const SizedBox(height: 32),
            SaveButton(onPressed: () {

            }),
          ],
        ),
      ),
    );
  }
}
