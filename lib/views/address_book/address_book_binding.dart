import 'package:get/get.dart';
import 'package:helmet_customer/views/address_book/address_book_controller.dart';

class AddressBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressBookController>(() => AddressBookController());
  }
}
