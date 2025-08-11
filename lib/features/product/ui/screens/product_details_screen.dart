import 'package:ecommerce_crafty_bay_live/app/app_colors.dart';
import 'package:ecommerce_crafty_bay_live/app/constants.dart';
import 'package:ecommerce_crafty_bay_live/core/ui/widgets/centeres_circular_progress-indicator.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/common/controllers/auth_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/product/controllers/product_details_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/product/data/models/product_details_model.dart';
import 'package:ecommerce_crafty_bay_live/features/product/ui/screens/product_review_screen.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/color_picker.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/inc_dec_button.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/product_image_slider.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController = ProductDetailsController();

  @override
  void initState() {
    _productDetailsController.getProductDetails(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (_) {
          if(_productDetailsController.inProgress){
            return CenteredCirclarProgressIndicator();
          }

          if(_productDetailsController.errorMessage != null){
            return Center(
              child: Text(_productDetailsController.errorMessage!),
            );
          }

          final ProductDetailsModel product = _productDetailsController.productDetails;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImageSlider(images: product.photoUrls,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    product.title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.6,
                                        color: Colors.black54),
                                  ),
                                ),
                                IncDecButton(
                                  onChange: (int value) {},
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Colors.amber,
                                    ),
                                    Text('4.5'),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductReviewScreen()));

                                    },
                                    child: Text(
                                      "Reviews",
                                      style: TextStyle(fontSize: 16),
                                    )),
                                Card(
                                  color: AppColors.themeColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.favorite_outline_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Visibility(
                              visible: product.colors.isNotEmpty,
                              child: Column(
                                children: [
                                  Text(
                                    "Color",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ColorPicker(colors: product.colors, onSelected: (String value) {}),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Visibility(
                              visible: product.sizes.isNotEmpty,
                              child: Column(
                                children: [
                                  Text(
                                    "Size",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black54),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizePicker(
                                    sizes: product.sizes,
                                    onSelected: (String value) {},
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                            Text(
                              product.description,
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildPriceAndAddToCartSection(product)
            ],
          );
        }
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(ProductDetailsModel product) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.15),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "Price",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "${Constants.takaSign}${product.currentPrice}",
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
                  ElevatedButton(onPressed: _onTapAddToCart, child: Text("Add To Cart")))
        ],
      ),
    );
  }

  Future<void> _onTapAddToCart()async{
    if(await Get.find<AuthController>().isUserLoggedIn()){
      //TODO Add to cart
    }
    else{
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }

}
