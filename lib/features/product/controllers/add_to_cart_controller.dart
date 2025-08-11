import 'package:ecommerce_crafty_bay_live/core/services/network/network_client.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(String id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.addToCartUrl, body: {'product': id});

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
