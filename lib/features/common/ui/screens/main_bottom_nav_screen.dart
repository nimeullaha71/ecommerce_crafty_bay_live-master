import 'package:ecommerce_crafty_bay_live/features/cart/ui/screens/cart_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/common/controllers/category_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/product/ui/screens/product_category_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/wish_list/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../home/ui/controllers/home_slider_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static final String name = '/main-bottom-nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    ProductCategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getHomeSliders();
    Get.find<CategoryListController>().getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(

      builder: (navController) {
        return Scaffold(
          body: _screens[navController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: navController.selectedIndex,
              onDestinationSelected: navController.changeIndex,
              destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.category), label: 'Categories'),
            NavigationDestination(icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
            NavigationDestination(icon: Icon(Icons.wallet_giftcard), label: 'Wish'),
          ]),
        );
      }
    );
  }
}
