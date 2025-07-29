import 'package:ecommerce_crafty_bay_live/app/asset_paths.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/product/ui/screens/product_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_carousel_slider.dart';
import '../../../common/ui/widgets/product_category_item.dart';
import '../widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              ProductSearchBar(),
              SizedBox(
                height: 16,
              ),
              HomeCarouselSlider(),
              SizedBox(
                height: 16,
              ),
              _buildSectionHeader(title: "All Categories", onTapSeeAll: () {
                Get.find<MainBottomNavController>().moveToCategory();
              }),
              _getCategoryList(),
              _buildSectionHeader(title: "Popular", onTapSeeAll: () {}),
              _buildSectionHeader(title: "Special", onTapSeeAll: () {}),
              _buildSectionHeader(title: "New", onTapSeeAll: () {}),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navAppLogoSvg),
      actions: [
        AppBarIconButton(iconData: Icons.person, onTap: () {}),
        AppBarIconButton(iconData: Icons.phone, onTap: () {}),
        AppBarIconButton(iconData: Icons.notifications_active, onTap: () {}),
      ],
    );
  }

  Widget _buildSectionHeader(
      {required String title, required VoidCallback onTapSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextButton(onPressed: onTapSeeAll, child: Text("See All")),
      ],
    );
  }

  Widget _getCategoryList(){
    return SizedBox(
      height: 100,
      child: ListView.separated(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return ProductCategoryItem();
          }, separatorBuilder: (context,index)=>const SizedBox(width: 8,),

      ),
    );
  }
}