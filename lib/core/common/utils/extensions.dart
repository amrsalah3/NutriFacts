extension DoubleFormats on double {
  String get withOneFractionDigit => toStringAsFixed(1);

  String get withTwoFractionDigits => toStringAsFixed(2);
}

extension StringNumberValidation on String {
  bool get isEmptyOrValidNumber {
    if (isEmpty) return true;
    if (contains(" ")) return false;
    if (double.tryParse(this) == null) return false;

    return true;
  }
}
