class Validator {
  static bool checkNotEmpty(String? text) => text != null && text.isNotEmpty;

  static bool checkName(String? name) =>
      checkNotEmpty(name) && name!.length >= 3;

  static bool checkEmail(String? email) =>
      checkNotEmpty(email) &&
      RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(email!);

  static bool checkPassword(String? password) =>
      password != null && password.length >= 8;

  static bool checkRePassword(String? rePassword, String? password) =>
      rePassword != null && rePassword == password;

  static bool checkPhone(String? phone) =>
      checkNotEmpty(phone) &&
      RegExp(r"^01[0-2,5]{1}[0-9]{8}$").hasMatch(phone!);


}

