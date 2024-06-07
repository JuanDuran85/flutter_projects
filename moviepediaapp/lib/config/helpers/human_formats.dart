// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';


class HumanFormats {
  static String compactHugeNumber(double number) {
    return NumberFormat.compact().format(number);
  }
}