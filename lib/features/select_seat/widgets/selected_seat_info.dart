import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart'; // Lokalizatsiya uchun AppTexts import qilingan
import 'package:easy_localization/easy_localization.dart'; // EasyLocalization import

class SelectedSeatInfo extends StatelessWidget {
  final String selectedSeat;

  const SelectedSeatInfo({super.key, required this.selectedSeat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.selectedSeat.tr(),
            style: const TextStyle(
              color: AppColors.textBlack,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Stack(
            clipBehavior: Clip.none, // Stack elementlarini ko'rsatish uchun
            children: [
              // Tanlangan joy uchun konteyner
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Kontentga mos hajm
                  children: [
                    const Icon(
                      Icons.person,
                      color: AppColors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "#1 $selectedSeat", // Joy raqami + tanlangan joy
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // O'rindiqni o'chirish tugmasi
              Positioned(
                top: -8,
                right: -8,
                child: GestureDetector(
                  onTap: () {
                    // O'rindiqni bekor qilish funksiyasi bu yerda qo'shiladi
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: AppColors.textBlack,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.remove,
                        color: AppColors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
