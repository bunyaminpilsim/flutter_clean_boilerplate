class Validators {
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'E-posta boş olamaz';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Geçerli bir e-posta adresi girin';
    }

    return null;
  }

  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Şifre boş olamaz';
    }

    if (value.length < minLength) {
      return 'Şifre en az $minLength karakter olmalı';
    }

    return null;
  }

  static String? required(String? value, [String fieldName = 'Bu alan']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName boş olamaz';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon numarası boş olamaz';
    }

    // Türkiye telefon formatı: 05XXXXXXXXX
    final phoneRegex = RegExp(r'^05\d{9}$');

    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'\s'), ''))) {
      return 'Geçerli bir telefon numarası girin (05XXXXXXXXX)';
    }

    return null;
  }

  static String? minLength(String? value, int min,
      [String fieldName = 'Bu alan']) {
    if (value == null || value.isEmpty) {
      return '$fieldName boş olamaz';
    }

    if (value.length < min) {
      return '$fieldName en az $min karakter olmalı';
    }

    return null;
  }

  static String? maxLength(String? value, int max,
      [String fieldName = 'Bu alan']) {
    if (value != null && value.length > max) {
      return '$fieldName en fazla $max karakter olmalı';
    }

    return null;
  }

  static String? match(String? value, String? otherValue, String fieldName) {
    if (value != otherValue) {
      return '$fieldName eşleşmiyor';
    }

    return null;
  }
}
