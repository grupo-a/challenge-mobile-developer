import 'package:intl/intl.dart';

class ValidatorsHelper {
  static DateTime? convertDateMMddyyyy(String? value) {
    try {
      if (value == null || value.isEmpty) {
        return null;
      }

      value = value.replaceAll('/', '-');

      DateFormat inputFormat = DateFormat('MM-dd-yyyy');
      return inputFormat.parse(value);
    } catch (e) {
      return null;
    }
  }

  static bool isValidEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-_]+\.[a-zA-Z]+")
        .hasMatch(value);

    // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
    return emailValid;
  }

  static bool isValidPhone(String value) {
    return RegExp(
            r"(\+[1-9]{2,3}\([0-9]{2}\)\s?[0-9]{4,5}-?[0-9]{3,4})|(\([0-9]{2}\)\s?[0-9]{4,5}-?[0-9]{3,4})|([0-9]{10,11})|([0-9]{2}\s?[0-9]{8,9})")
        .hasMatch(value);
  }

  static bool isValidDate(String? date) {
    if (date == null || date.isEmpty || date.length < 10) return false;

    var isIsoDateFormat =
        RegExp(r'^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}\w+').hasMatch(date);

    if (date.isNotEmpty) {
      DateFormat inputFormat = DateFormat("dd/MM/yyyy");

      try {
        if (isIsoDateFormat) {
          DateTime.parse(date);
        } else {
          inputFormat.parse(date);
        }
      } catch (e) {
        return false;
      }
    }
    return true;
  }
}
