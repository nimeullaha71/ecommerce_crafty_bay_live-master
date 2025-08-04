import 'package:ecommerce_crafty_bay_live/core/services/network/network_client.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/data/models/sign_up_request_model.dart';
import 'package:ecommerce_crafty_bay_live/features/auth/data/models/verify_otp_request_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;


  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> verisyOtp(VeridyOtpRequestModel model) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.verifyOtpUrl, body: model.toJson());

    if(response.isSuccess){
      //save user data
      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage!;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
