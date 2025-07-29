import 'package:ecommerce_crafty_bay_live/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/product/ui/screens/product_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../features/auth/ui/screens/splash_screen.dart';

class AppRoutes{
  static Route<dynamic> routes(RouteSettings settings){
    late final Widget screenWidget;

    if(settings.name == SplashScreen.name){
      screenWidget = SplashScreen();
    }
    else if (settings.name == LoginScreen.name){
      screenWidget = LoginScreen();
    }
    else if(settings.name == SignUpScreen.name){
      screenWidget = SignUpScreen();
    }
    else if (settings.name==MainBottomNavScreen.name){
      screenWidget = MainBottomNavScreen();
    }
    return MaterialPageRoute(builder: (context)=>screenWidget);
  }
}