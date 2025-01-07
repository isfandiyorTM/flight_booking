import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_strings.dart';
import 'widgets/section_title.dart';
import 'widgets/contact_details.dart';
import 'widgets/passenger_info.dart';
import 'widgets/facility_section.dart';
import 'widgets/extra_protection_section.dart';
import 'widgets/subtotal_section.dart';
import 'package:easy_localization/easy_localization.dart';

class BookingDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: AppColors.textBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          AppTexts.searchFlights.tr(),
          style: const TextStyle(
            color: AppColors.textBlack,
          ),
        ),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: AppTexts.contactDetails.tr(), subtitle: AppTexts.forVoucher.tr()),
            const ContactDetails(),
            const SizedBox(height: 20),
             SectionTitle(title: AppTexts.passengerInfo.tr() ),
            const PassengerInfo(),
            const SizedBox(height: 20),
             SectionTitle(title: AppTexts.facility.tr()),
            const FacilitySection(),
            const SizedBox(height: 20),
             SectionTitle(title: AppTexts.extraProtection.tr()),
            const ExtraProtectionSection(),
            const SizedBox(height: 20),
            const SubtotalSection(),
          ],
        ),
      ),
    );
  }
}
