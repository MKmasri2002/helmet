import 'package:helmet_customer/utils/exptions.dart';

class ValidationsMetod {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(RegExption.email);
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    if (value.contains(' ')) {
      return 'Email should not contain spaces';
    }
    if (!value.contains('@')) {
      return 'Email should contain @ symbol';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    final passwordRegex = RegExp(RegExption.passwordPattern);
    if (!passwordRegex.hasMatch(value) || value.length < 8) {
      return 'Password must be 8+ chars with upper, lower, number & special char';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    if (!value.startsWith('07')) {
      return 'Phone number should start with 07';
    }
    final phoneRegex = RegExp(RegExption.onlyNumber);
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateName(String? value) {
    // check if the name only space
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    // final regex = RegExp(RegExption.arabicAndEnglish);
    // if (regex.hasMatch(value)) {
    //   return 'Name can only contain Arabic and English letters';
    // }
    return null;
  }
}
