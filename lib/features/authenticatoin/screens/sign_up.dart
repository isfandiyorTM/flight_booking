import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/constants/snackbar.dart'; // Import snackbar utility
import '../../../core/route/route_names.dart';
import '../../../helpers/helper_functions.dart';
import '../widgets/authentification_button.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_input.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final _formKey = GlobalKey<FormState>();

  // Email va Password uchun Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> signUpUser(BuildContext context) async {
    final supabase = Supabase.instance.client;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Parolni minimal uzunligini tekshirish
    if (password.length < 6) {
      AppSnackbar.show(
        context: context,
        title: AppTexts.error,
        message: AppTexts.signUpPasswordTooShort,
        contentType: ContentType.failure,
      );
      return;
    }

    if (email.isEmpty || password.isEmpty) {
      AppSnackbar.show(
        context: context,
        title: AppTexts.error,
        message: AppTexts.signUpEmptyFields,
        contentType: ContentType.failure,
      );
      return;
    }

    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        AppSnackbar.show(
          context: context,
          title: AppTexts.success,
          message: AppTexts.signUpSuccess,
          contentType: ContentType.success,
        );
        Navigator.pushNamed(context, RouteNames.bottomNavBar);
      } else if (response.session == null) {
        AppSnackbar.show(
          context: context,
          title: AppTexts.error,
          message: AppTexts.signUpError,
          contentType: ContentType.failure,
        );
      }
    } catch (e) {
      AppSnackbar.show(
        context: context,
        title: AppTexts.error,
        message: '${AppTexts.error}: $e',
        contentType: ContentType.failure,
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: AppColors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(height: 50),
                const Text(
                  AppTexts.signUp,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack,
                  ),
                ).tr(),
                const SizedBox(height: 10),
                const Text(
                  AppTexts.startYourJourney,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGray,
                  ),
                ).tr(),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomInput(
                        labelText: AppTexts.email,
                        hintText: AppTexts.enterEmail,
                        controller: emailController,
                      ),
                      CustomInput(
                        labelText: AppTexts.password,
                        hintText: AppTexts.enterPassword,
                        controller: passwordController,
                      ),
                      CutomButton(
                        text: AppTexts.signUp,
                        bgColor: AppColors.blue,
                        textColor: AppColors.white,
                        icon: const Icon(
                          Icons.check_circle,
                          color: AppColors.white,
                        ),
                        width: HelperFunctions.screenWidth(),
                        onPressed: () => signUpUser(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: const Text(
                    AppTexts.orSignUpWith,
                    style: TextStyle(
                      color: AppColors.textGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ).tr(),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AuthentificationButton(
                      icon: const Icon(
                        Icons.facebook,
                        size: 35,
                      ),
                    ),
                    AuthentificationButton(
                      icon: const Icon(
                        Icons.g_mobiledata_rounded,
                        size: 50,
                      ),
                    ),
                    AuthentificationButton(
                      icon: const Icon(
                        Icons.apple,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppTexts.dontHaveAccount,
                      style: TextStyle(
                        color: AppColors.textGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ).tr(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signIn);
                      },
                      child: const Text(AppTexts.signIn, style: TextStyle(color: AppColors.blue)).tr(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}