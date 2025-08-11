import 'package:ecommerce_crafty_bay_live/core/services/network/network_client.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/controller/login_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/controller/sign_up_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/common/controllers/auth_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/common/controllers/category_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/home/ui/controllers/home_slider_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/product/controllers/product_list_category_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(MainBottomNavController());
    Get.put(NetworkClient(
        onUnAuthorize: _onUnAuthorize,
        commonHeaders: _commonHeaders(),
    ));
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
    Get.put(LoginController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
  }

  void _onUnAuthorize()async{
    await Get.find<AuthController>().clearUserData();
    Get.to(()=>LoginScreen());
  }

  Map<String, String> _commonHeaders() {
    return {'content-type': 'application/json',
  'token': Get.find<AuthController>().accessToken ?? '',
  };
  }
}
