import 'package:ecommerce_crafty_bay_live/features/product/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person_outline, size: 24,),
                              SizedBox(width: 4,),
                              Text("Nime Ullaha",
                                style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Text(
                              "hsdfagfh sdjag sjaefgta ejh esjfgeyf ejhayfe jehfgaetuf sfvtefv hjefa"),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
          Container(
            height: 88,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )
            ),
            child: Row(
              children: [
                Text("Reviews (100)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black54),),
              ],
            )
          )
        ],
      ),
        
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateReviewScreen()));
      },child: Icon(Icons.add),),
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
