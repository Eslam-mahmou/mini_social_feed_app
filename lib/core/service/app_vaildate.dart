class AppValidate {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email ';
    }
    final regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email ';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password ';
    }
    if (value.length < 8) {
      return 'Password should be at least 8 characters long ';
    }
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    if (!regex.hasMatch(value)) {
      return 'Password should contain at least one uppercase letter, one lowercase letter, one number, and one special character ';
    }
    return null;
  }

  static String? validateUserName(String? value) {
    RegExp userNameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!userNameRegex.hasMatch(value)) {
      return 'Please enter a valid username';
    } else {
      return null;
    }
  }

}
