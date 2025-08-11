import 'package:ecommerce_crafty_bay_live/core/services/network/network_client.dart';
import 'package:ecommerce_crafty_bay_live/features/common/models/product_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class NewProductController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  List<ProductModel> _newModelList = [];

  List<ProductModel> get newModelList => _newModelList;

  Future<bool> getNewProducts() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
    await Get.find<NetworkClient>().getRequest(Urls.productByTagUrl('new'));

    if(response.isSuccess){
      List<ProductModel>list = [];
      for(Map<String,dynamic> slider in response.responseData!['data']['results']){
        list.add(ProductModel.fromJson(slider));
      }
      _newModelList =list;
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
