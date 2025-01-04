import 'package:flutter/material.dart';
import 'package:t_store/core/route/route_names.dart';
import 'package:t_store/features/authenticatoin/screens/onboarding.dart';
import 'package:t_store/features/payment/screens/payment_methods_page.dart';
import 'package:t_store/features/settings/screens/confirm_pin_page.dart';
import 'package:t_store/features/settings/screens/delete_account_page.dart';
import 'package:t_store/features/settings/screens/email_and_mobile_setting.dart';
import 'package:t_store/features/settings/screens/language_setting.dart';
import 'package:t_store/features/settings/screens/security_setting.dart';
import 'package:t_store/features/settings/screens/set_pin_page.dart';
import 'package:t_store/features/settings/screens/settings_page.dart';
import '../../features/authenticatoin/screens/sign_in.dart';
import '../../features/authenticatoin/screens/sign_up.dart';
import '../../features/bottom_nav_bar.dart';
import '../../features/payment/screens/order_confirmed_page.dart';
import '../../features/payment/screens/passcode_page.dart';
import '../../features/settings/screens/notification_setting.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.signIn:
        return MaterialPageRoute(builder: (_) =>  SignIn());

      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) =>  SignUp());

      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (_) =>  const Onboarding());

      case RouteNames.bottomNavBar:
        return MaterialPageRoute(builder: (_) =>  BottomNavBar());

      case RouteNames.settings:
        return MaterialPageRoute(builder: (_) =>   SettingsPage());

      case RouteNames.languageSettings:
        return MaterialPageRoute(builder: (_) =>  LanguageSelectionPage());

      case RouteNames.notificationSettings:
        return MaterialPageRoute(builder: (_) =>  NotificationSettingsPage());

      case RouteNames.emailAndMobileNumber:
        return MaterialPageRoute(builder: (_) =>  EmailAndMobilenumberPage());

      case RouteNames.securitySettings:
        return MaterialPageRoute(builder: (_) =>  SecuritySettingsPage());

      case RouteNames.setPin:
        return MaterialPageRoute(builder: (_) =>  SetPinPage());

      case RouteNames.confirmPage:
        return MaterialPageRoute(builder: (_) =>  ConfirmPinPage());

      case RouteNames.deleteAccount:
        return MaterialPageRoute(builder: (_) =>  const DeleteAccountPage());

      case RouteNames.paymentMethods:
        return MaterialPageRoute(builder: (_) =>  const PaymentMethodsPage());

      case RouteNames.passcodePage:
        return MaterialPageRoute(builder: (_) =>   PassCodePage());

      case RouteNames.orderConfirmed:
        return MaterialPageRoute(builder: (_) =>   const OrderConfirmedPage());



      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
