import 'package:ecommerce_crafty_bay_live/app/app_colors.dart';
import 'package:ecommerce_crafty_bay_live/app/app_routes.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.name,
      theme: AppTheme.lightThemeData,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
