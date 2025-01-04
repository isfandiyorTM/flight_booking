import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/route/route_names.dart';
import '../widgets/payment_method_widget.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  String verificationValue = AppTexts.paypal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            CupertinoIcons.back,
            color: AppColors.textBlack,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppTexts.digitalPaymentMethods,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ).tr(),
            const Text(
              AppTexts.swipeLeft,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlack,
              ),
            ).tr(),
            PaymentMethodWidget(
                leading: const Image(image: AssetImage(AppImages.mastercard)),
                title: AppTexts.card,
                subTitle: AppTexts.discount,
                trailing: Radio(
                    value: AppTexts.card,
                    groupValue: verificationValue,
                    activeColor: AppColors.blue,
                    onChanged: (dynamic value) {
                      setState(() {
                        verificationValue = value;
                      });
                    })),
            PaymentMethodWidget(
                leading: const Image(image: AssetImage(AppImages.paypal)),
                title: AppTexts.paypal,
                subTitle: AppTexts.discount,
                trailing: Radio(
                    value: AppTexts.paypal,
                    groupValue: verificationValue,
                    activeColor: AppColors.blue,
                    onChanged: (dynamic value) {
                      setState(() {
                        verificationValue = value;
                      });
                    })),
            const SizedBox(height: 30),
            const Text(
              AppTexts.addMethods,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ).tr(),
            PaymentMethodWidget(
              leading: const Icon(
                Iconsax.card,
                color: AppColors.blue,
              ),
              title: AppTexts.creditOrDebitCard,
              subTitle: AppTexts.visaMasterCard,
              trailing: TextButton(
                onPressed: () {  },
                child: const Text(
                  AppTexts.add,
                  style: TextStyle(fontSize: 16, color: AppColors.blue),
                ),
              ),
            ),
            PaymentMethodWidget(
              leading: const Icon(
                CupertinoIcons.refresh_bold,
                color: AppColors.blue,
              ),
              title: AppTexts.transfer,
              subTitle: AppTexts.transferSubtitle,
              trailing: TextButton(
                onPressed: () {  },
                child: const Text(
                  AppTexts.add,
                  style: TextStyle(fontSize: 16, color: AppColors.blue),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppTexts.subtotal,style: TextStyle(fontSize: 12,color: AppColors.textGray),),
                    Text("\$132",style: TextStyle(fontSize:24,color: AppColors.textBlack,fontWeight: FontWeight.w500),),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RouteNames.passcodePage);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      padding: const EdgeInsets.symmetric(vertical: 15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: [
                        const Text(
                          AppTexts.proceedThePayment,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ).tr(),
                        const Icon(CupertinoIcons.checkmark_alt_circle_fill,color: AppColors.white,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
