import 'package:get/get.dart';

class Validation {
  ///name
  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "First name is required";
    }
    return null;
  }

  String? validateName(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Last name is required";
    }
    return null;
  }

  ///Phone number

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    if (!value.isPhoneNumber) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  String? validation(String? value, String? hintText) {
    if (value == null || value.isEmpty) {
      return "$hintText is required";
    }
    return null;
  }

  String? validateEmail(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!value.isEmail) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return 'Password must be longer than 8 characters.\n';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Uppercase letter is missing.\n';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Lowercase letter is missing.\n';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Digit is missing.\n';
    } else if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return 'Special character is missing.\n';
    }
    return null;
  }

  /// confirm password
  String? validateConfirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password is required";
    } else if (confirmPassword != password) {
      return "Confirm password should be same";
    }
    return null;
  }
}
