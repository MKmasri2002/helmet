import 'package:get/get.dart';
import 'package:helmet_customer/models/address/addresses.dart';
import 'package:helmet_customer/models/schedule_list.dart';
import 'package:moyasar/moyasar.dart';

const String googleApi = "AIzaSyB10bUvev3cL3COPb2EQwiEOVb7jRTszgo";

Rx<AddressModel> currentAddress = AddressModel().obs;

List<ScheduleModel> schedulesList = [];
double screenWidth = 0.0;
double screenHeight = 0.0;

class Constants {
  static const String payKey =
      'pk_test_mPvg7yGw1bDmoMQjAW9XuBkvLnjr9QzMFny4GQuN';
  static const String appleKey = 'merchant.com.helmet.customer.app';
  static const String appName = "Helmet Customer";
  static const String pending = "pending";
  static const String inProgress = "in_progress";
  static const String approved = "approved";
  static const String completed = "completed";
  static const String cancelled = "cancelled";
}

class PaymentMethods {
  static PaymentConfig payWithMoyasarCridetCard(double amount) {
    PaymentConfig paymentConfig = PaymentConfig(
      publishableApiKey: Constants.payKey,
      amount: (amount * 100).toInt(), // SAR 257.58
      description: 'order #1324',
      metadata: {'size': '250g'},
      creditCard: CreditCardConfig(saveCard: true, manual: false),
      applePay: ApplePayConfig(
          merchantId: Constants.appleKey,
          label: 'Helmet',
          manual: false,
          saveCard: false),
    );

    return paymentConfig;
    // Implement payment logic here
  }

  static PaymentConfig payWithMoyasarApplePay(double amount) {
    PaymentConfig paymentConfig = PaymentConfig(
      publishableApiKey: Constants.payKey,
      amount: (amount * 100).toInt(), // SAR 257.58
      description: 'order #1324',
      metadata: {'size': '250g'},
      creditCard: CreditCardConfig(saveCard: true, manual: false),
      applePay: ApplePayConfig(
        merchantId: Constants.appleKey,
        label: 'Helmet',
        manual: false,
        saveCard: false,
      ),
    );
    return paymentConfig;
    // Implement payment logic here
  }
}
