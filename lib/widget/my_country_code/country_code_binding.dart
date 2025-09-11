import 'package:get/get.dart';
import 'package:helmet_customer/widget/my_country_code/country_code_method.dart';

class CountryCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryCodeMethod>(() => CountryCodeMethod());
  }
}
