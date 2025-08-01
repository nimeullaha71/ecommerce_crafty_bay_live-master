import 'package:ecommerce_crafty_bay_live/app/app_colors.dart';
import 'package:ecommerce_crafty_bay_live/app/constants.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/inc_dec_button.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/product_image_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ProductImageSlider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text("Nike 1204HST - new shoe of 2025",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6,
                              color: Colors.black54
                            ),),
                          ),
                          IncDecButton(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildPriceAndAddToCartSection()
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.15),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24))),
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
                    "${Constants.takaSign}1000",
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
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Add To Cart")))
            ],
          ),
        );
  }
}
