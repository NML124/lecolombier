import 'package:lecolombier/customWidget/components/type.dart';

abstract class Validator {
  String? validate(String? value);
}

class EmailValidator implements Validator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}

class PasswordValidator implements Validator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}

class StringValidator implements Validator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    return null;
  }
}

class IntValidator implements Validator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid integer';
    }
    return null;
  }
}

class DoubleValidator implements Validator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }
}

class ValidatorFactory {
  static Validator getValidator(String type) {
    switch (type) {
      case TypeForm.email:
        return EmailValidator();
      case TypeForm.password:
        return PasswordValidator();
      case TypeForm.int:
        return IntValidator();
      case TypeForm.double:
        return DoubleValidator();
      case TypeForm.string:
        return StringValidator();
      default:
        throw UnimplementedError('Validator for type $type is not implemented');
    }
  }
}
