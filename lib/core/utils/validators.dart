class SValidator {
  static String? stringValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "*Required";
    } else {
      return null;
    }
  }

  static String? validatePhone(value) {
    String exp = r'(^(?:[+0]9)?[0-9]{10,10}$)';
    RegExp regExp = RegExp(exp);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String? validateEmail(value, {List<String>? existingEmails}) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value) || value == null) {
      return 'Enter a valid email address';
    } else if ((existingEmails ?? []).where((email) => email == value).length >
        1) {
      return 'This Email already exists in the list';
    }
    return null;
  }

  // add common validators here
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    } else if (value.length < 5) {
      return 'Address must be at least 5 characters long';
    }
    return null;
  }

  static String? validateZipCode(String? value) {
    String pattern = r'^\d{5}(-\d{4})?$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Zip code is required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid zip code';
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    } else if (value.length != 6) {
      return 'OTP must be 6 digits long';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password is required';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
