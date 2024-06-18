import 'package:dev_tools/app/knowledge/mock/data_point.dart';
import 'package:get/get.dart';

/// @description:
/// @author
/// @date: 2024-06-03 09:40:54
class KnowledgeHomeState {
  final List<DataPoint> dataPoints = [
    DataPoint(0, 0),
    DataPoint(1, 1),
    DataPoint(2, 1),
    DataPoint(3, 2),
    DataPoint(4, 3),
    DataPoint(5, 4),
    DataPoint(6, 5),
    DataPoint(7, 6),
    DataPoint(8, 7),
    DataPoint(9, 8),
  ].obs;

  KnowledgeHomeState();

  var chartDate = {}.obs;

  var date = {}.obs;

  var stateValue = 000000.0.obs;
  var stateDateTime = ''.obs;

  List<int> getIntegerPartDigits(double number) {
    int integerPart = number.floor();

    List<int> digits0 = [];

    while (integerPart > 0) {
      int digit = integerPart % 10;
      digits0.add(digit);

      integerPart = integerPart ~/ 10;
    }
    return digits0;
  }

  List<int> getDecimalPartDigits(double number) {
    double decimalPart = number - number.floor();
    List<int> digits = [];
    int decimalPlace = 1;

    while (decimalPart > 0 && decimalPlace <= 3) {
      // 限制到100位小数
      decimalPart *= 10;
      int digit = decimalPart.floor();
      digits.add(digit);
      decimalPart -= digit;
      decimalPlace++;
    }

    return digits;
  }
}
