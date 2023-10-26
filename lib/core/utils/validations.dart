class Validations {
  Validations._();
  static String? Function(String?) usernameValidation = (value) {
    if (value == null || value.isEmpty) {
      return 'Bu alan boş bırakılamaz.';
    } else if (value.length < 4) {
      return 'En az 4 karakter girmelisiniz.';
    }
    return null;
  };

  static String? Function(String?) passwordValidation = (value) {
    if (value == null || value.isEmpty) {
      return 'Bu alan boş bırakılamaz.';
    } else if (value.length < 8) {
      return 'En az 8 karakter girmelisiniz.';
    }
    return null;
  };

  static String? Function(String?) emailValidation = (value) {
    if (value == null || value.isEmpty) {
      return 'Bu alan boş bırakılamaz.';
    } else if (!_isValidEmail(value)) {
      return 'Geçerli bir eposta adresi giriniz.';
    }
    return null;
  };

  static bool _isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,4})$');
    return emailRegex.hasMatch(email);
  }
}
