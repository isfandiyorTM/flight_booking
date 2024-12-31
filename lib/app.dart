import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/route/route_generator.dart';
import 'core/route/route_names.dart';
import 'features/authenticatoin/screens/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Onboarding(),
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}
