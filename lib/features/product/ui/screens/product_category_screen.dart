import 'package:ecommerce_crafty_bay_live/core/ui/widgets/centeres_circular_progress-indicator.dart';
import 'package:ecommerce_crafty_bay_live/features/common/controllers/category_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  static final String name = '/product-category';

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategoryScreen> {

  final ScrollController _scrollController = ScrollController();
  final CategoryListController _categoryListController = Get.find<CategoryListController>();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      _categoryListController.getCategoryList();
    }
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNavController>().backToHome();
          }, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: GetBuilder<CategoryListController>(
          builder: (controller){
            if(controller.initialLoadingInProgress){
              return CenteredCirclarProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      controller: _scrollController,
                        itemCount: controller.categoryModelList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index) {
                          return FittedBox(child: ProductCategoryItem(categoryModel: controller.categoryModelList[index],));
                        }),
                  ),
                ),
                Visibility(
                    visible: controller.inProgress,
                    child: LinearProgressIndicator())
              ],
            );
          }
        ),
      ),
    );
  }
}
