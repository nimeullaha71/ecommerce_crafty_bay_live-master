import 'package:ecommerce_crafty_bay_live/core/ui/widgets/centeres_circular_progress-indicator.dart';
import 'package:ecommerce_crafty_bay_live/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../product/ui/widget/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartListController _cartListController = Get.find<CartListController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _cartListController.getCartItemList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        _backToHome();

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
          ),
          leading: IconButton(onPressed: _backToHome, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: GetBuilder(
          init: _cartListController,
          builder: (_) {
            if(_cartListController.inProgress)
              {
                return CenteredCirclarProgressIndicator();
              }
            if(_cartListController.errorMessage != null){
              return Center(
                child: Text(_cartListController.errorMessage!),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                        itemCount: _cartListController.cartItemList.length,
                      itemBuilder: (context, index) {
                          return CartItem(cartItemModel: _cartListController.cartItemList[index],);
                    }, separatorBuilder: (_,__)=>const SizedBox(height: 4,),),
                  ),
                ),
                _buildPriceAndCheckOutSection(),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _buildPriceAndCheckOutSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)
          ),
        color: AppColors.themeColor.withOpacity(0.3)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Price",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "${Constants.takaSign}${_cartListController.totalPrice}",

                style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )
            ],
          ),
          Spacer(),
          SizedBox(
              width: 120,
              child:
                  ElevatedButton(onPressed: () {}, child: Text("CheckOut")))
        ],
      ),
    );
  }

  void _backToHome(){
    Get.find<MainBottomNavController>().backToHome();
  }

}


