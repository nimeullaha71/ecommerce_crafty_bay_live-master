import 'package:ecommerce_crafty_bay_live/core/services/network/network_client.dart';
import 'package:ecommerce_crafty_bay_live/features/product/data/models/product_details_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  late ProductDetailsModel _productDetails ;

  ProductDetailsModel get productDetails => _productDetails;

  Future<bool> getProductDetails(String id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
    await Get.find<NetworkClient>().getRequest(Urls.productDetailsUrl(id));

    if(response.isSuccess){
      _productDetails =ProductDetailsModel.fromJson(response.responseData!['data']);
      isSuccess = true;
      _errorMessage = null;
    }
    else{
      _errorMessage = response.errorMessage!;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
