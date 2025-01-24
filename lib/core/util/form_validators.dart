class FormValidators{
  static String? validateNotEmpty(String? value) {
    return (value == null || value.isEmpty) ? 'This field is required' : null;
  }

  static String? validateEmail(String? value) {
    return (value == null || value.isEmpty)
        ? 'Please enter your email address'
        : !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)
        ? 'Please enter a valid email address'
        : null;
  }
}