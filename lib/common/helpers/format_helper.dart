import 'package:intl/intl.dart';

class FormatHelper {
  FormatHelper._();

  static NumberFormat getCurrencyFormat() {
    return NumberFormat("#,##0.00", "en_US");
  }

  static String getQuantityFormat(String value) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    return value.replaceAll(regex, '');
  }
}
