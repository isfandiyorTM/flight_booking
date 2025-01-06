import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import 'widgets/section_title.dart';
import 'widgets/contact_details.dart';
import 'widgets/passenger_info.dart';
import 'widgets/facility_section.dart';
import 'widgets/extra_protection_section.dart';
import 'widgets/subtotal_section.dart';

class BookingDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Search Flights",
          style: TextStyle(
            color: AppColors.textBlack,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Contact Details", subtitle: "(For E-Ticket/Voucher)"),
            ContactDetails(),
            SizedBox(height: 20),
            SectionTitle(title: "Passenger Info"),
            PassengerInfo(),
            SizedBox(height: 20),
            SectionTitle(title: "Facility"),
            FacilitySection(),
            SizedBox(height: 20),
            SectionTitle(title: "Extra Protection"),
            ExtraProtectionSection(),
            SizedBox(height: 20),
            SubtotalSection(),
          ],
        ),
      ),
    );
  }
}
