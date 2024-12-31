import 'package:flutter/material.dart';
import 'package:t_store/core/route/route_names.dart';
import 'package:t_store/features/authenticatoin/screens/onboarding.dart';
import '../../features/authenticatoin/screens/sign_in.dart';
import '../../features/authenticatoin/screens/sign_up.dart';
import '../../features/bottom_nav_bar.dart';

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
