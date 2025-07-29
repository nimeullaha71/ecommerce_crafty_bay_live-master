import 'package:ecommerce_crafty_bay_live/features/common/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  static final String name = '/product-category';

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
            itemCount: 50,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCategoryItem());
            }),
      ),
    );
  }
}
