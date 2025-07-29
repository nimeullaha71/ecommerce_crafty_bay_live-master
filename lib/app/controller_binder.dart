import 'package:ecommerce_crafty_bay_live/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies(){
    Get.put(MainBottomNavController());

  }
}