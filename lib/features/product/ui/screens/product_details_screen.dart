import 'package:ecommerce_crafty_bay_live/app/app_colors.dart';
import 'package:ecommerce_crafty_bay_live/app/constants.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/color_picker.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/inc_dec_button.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/product_image_slider.dart';
import 'package:ecommerce_crafty_bay_live/features/product/widget/size_picker.dart';
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Nike 1204HST - new shoe of 2025",
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
                                onPressed: () {},
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
                        ColorPicker(colors: [
                          'Black',
                          'Blue',
                          'Pink',
                          'White',
                          'Yellow'
                        ], onSelected: (String value) {}),
                        const SizedBox(
                          height: 16,
                        ),
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
                          sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                          onSelected: (String value) {},
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
                          "Nike shoes are designed with a focus on athletic performance and style, incorporating advanced technologies like Nike Air cushioning for comfort and support.",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
              child:
                  ElevatedButton(onPressed: () {}, child: Text("Add To Cart")))
        ],
      ),
    );
  }
}
