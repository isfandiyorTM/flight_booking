import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/route/route_generator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'features/authenticatoin/screens/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: const Onboarding(),
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}
