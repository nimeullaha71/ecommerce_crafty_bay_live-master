import 'package:ecommerce_crafty_bay_live/features/common/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/screens/main_bottom_nav_screen.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static final String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToHomeScreen();
  }

  Future<void>_moveToHomeScreen()async{
    await Future.delayed(Duration(seconds: 2));
    await Get.find<AuthController>().getUserData();
    Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(

              children: [
                Spacer(),
                AppLogo(),
                Spacer(),
                CircularProgressIndicator(),
                SizedBox(height: 16,),
                Text("Version 1.0.0",style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


