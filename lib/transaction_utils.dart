import 'package:intl/intl.dart';

class TransactionUtils {
  static String formatAmount(int input) {
    if (input == 0) {
      return '0';
    }

    return NumberFormat("#,##0.00", "en_US").format((input / 100));
  }
}
