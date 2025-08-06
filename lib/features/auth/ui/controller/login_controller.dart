import 'package:ecommerce_crafty_bay_live/core/services/network/network_client.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_crafty_bay_live/features/common/controllers/auth_controller.dart';
import 'package:ecommerce_crafty_bay_live/features/common/models/user_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class LoginController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> login(LoginRequestModel model) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.loginUrl, body: model.toJson());

    if (response.isSuccess) {
      Get.find<AuthController>().saveUserData(
          response.responseData!['data']['token'],
          UserModel.fromJson(response.responseData!['data']['user']));
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
