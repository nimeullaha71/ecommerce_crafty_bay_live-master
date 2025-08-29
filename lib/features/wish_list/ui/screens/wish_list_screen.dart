import 'package:ecommerce_crafty_bay_live/core/ui/widgets/centeres_circular_progress-indicator.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_colors.dart';
import '../../../common/ui/widgets/product_card.dart';
import '../controllers/wish_list_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    super.key,
  });

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<WishListController>().getProductWishList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("WishList"),
          leading: IconButton(
              onPressed: _backToHome, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GetBuilder<WishListController>(builder: (wishListController) {
            return Visibility(
              visible: wishListController.inProgress == false,
              replacement: const CenteredCirclarProgressIndicator(),
              child: GridView.builder(
                itemCount:
                    wishListController.wishListModel.wishListItem?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.90,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                      onLongPress: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  "Delete from wish list?",
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        final productId = wishListController.wishListModel.wishListItem![index].product?.id;
                                        if (productId != null) {
                                          wishListController.deleteWishList(productId as int); // make deleteWishList accept String
                                        }


                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                          color: AppColors.themeColor),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: FittedBox(
                        child: ProductCard(
                          productModel: wishListController.wishListModel.wishListItem![index].product!,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }

  void _backToHome() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
