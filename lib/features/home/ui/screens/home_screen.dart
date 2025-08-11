import 'package:ecommerce_crafty_bay_live/app/app_colors.dart';
import 'package:ecommerce_crafty_bay_live/app/asset_paths.dart';
import 'package:ecommerce_crafty_bay_live/core/ui/widgets/centeres_circular_progress-indicator.dart';
import 'package:ecommerce_crafty_bay_live/features/common/controllers/category_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/home/ui/controllers/home_slider_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/product/ui/screens/product_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/ui/widgets/product_card.dart';
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
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return SizedBox(
                      height: 192, child: CenteredCirclarProgressIndicator());
                }
                return HomeCarouselSlider(
                  sliders: sliderController.sliderModelList,
                );
              }),
              SizedBox(
                height: 16,
              ),
              _buildSectionHeader(
                  title: "All Categories",
                  onTapSeeAll: () {
                    Get.find<MainBottomNavController>().moveToCategory();
                  }),
              _getCategoryList(),
              _buildSectionHeader(title: "Popular", onTapSeeAll: () {}),
              _getPopularProducts(),
              _buildSectionHeader(title: "Special", onTapSeeAll: () {}),
              _getSpecialProducts(),
              _buildSectionHeader(title: "New", onTapSeeAll: () {}),
              _getNewProducts(),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPopularProducts() {
    return GetBuilder<PopularProductController>(
        builder: (popularProductController) {
      return Visibility(
        visible: popularProductController.inProgress == false,
        replacement: CenteredCirclarProgressIndicator(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: popularProductController.productModelList
                .map((product) => ProductCard(
                      productModel: product,
                    ))
                .toList(),
          ),
        ),
      );
    });
  }

  Widget _getSpecialProducts() {
    return GetBuilder<SpecialProductController>(
      builder: (specialProductController) {
        return Visibility(
          visible: specialProductController.inProgress==false,
          replacement: CenteredCirclarProgressIndicator(),
          child: SizedBox(
            height: 185,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: specialProductController.specialModelList.length,
              itemBuilder: (context, index) {
                final product = specialProductController.specialModelList[index];
                return ProductCard(productModel: product);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 8,
                );
              },
            ),
          ),
        );
      }
    );
  }

  Widget _getNewProducts() {
    return GetBuilder<NewProductController>(
      builder: (newProductController) {
        return Visibility(
          visible: newProductController.inProgress == false,
          replacement: CenteredCirclarProgressIndicator(),
          child: SizedBox(
            height: 185,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: newProductController.newModelList.length,
              itemBuilder: (context, index){
                final product = newProductController.newModelList[index];
                 return ProductCard(productModel: product,);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 8,
                );
              },
            ),
          ),
        );
      }
    );
  }

  AppBar _buildAppBar() {
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

  Widget _getCategoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryListController>(builder: (controller) {
        if (controller.initialLoadingInProgress) {
          return CenteredCirclarProgressIndicator();
        }
        return ListView.separated(
          itemCount: controller.homeCategoryListItemLength,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCategoryItem(
              categoryModel: controller.categoryModelList[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
        );
      }),
    );
  }
}
