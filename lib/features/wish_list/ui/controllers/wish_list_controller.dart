import 'package:ecommerce_crafty_bay_live/core/services/network/network_client.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../data/models/wish_list_model.dart';

class WishListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = "";

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;
  WishListModel _wishListModel = WishListModel();

  WishListModel get wishListModel => _wishListModel;

  Future<bool> createWishList(int wishProductId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
    await Get.find<NetworkClient>().getRequest(Urls.createWishList(wishProductId));
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> getProductWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await Get.find<NetworkClient>().getRequest(Urls.productWishList);
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseData!);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> deleteWishList(int wishId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
    await Get.find<NetworkClient>().getRequest(Urls.removeWishList(wishId));
    if (response.isSuccess) {
      isSuccess = true;
      getProductWishList();
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}