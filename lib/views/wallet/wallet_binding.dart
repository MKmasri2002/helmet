import 'package:get/get.dart';
import 'package:helmet_customer/views/wallet/wallet_controller.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController());
  }
}
