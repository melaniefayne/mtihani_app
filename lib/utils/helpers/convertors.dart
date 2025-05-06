import 'package:intl/intl.dart';

DateFormat shortDateFormat = DateFormat('dd/MM/yy');

String? getFormattedDate(DateTime? dateTime, DateFormat dtFormat) {
  if (dateTime == null) return null;
  return dtFormat.format(dateTime);
}

String addThousandSeparators(double value) {
  String formattedValue = value.toStringAsFixed(0);
  List<String> parts = formattedValue.split('.');
  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

  final regExp = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  return integerPart.replaceAllMapped(regExp, (Match match) => '${match[1]},') +
      decimalPart;
}

String getThousandsNumber(double number) {
  if (number < 10000) return addThousandSeparators(number);

  double divisor = 1;
  String suffix = '';

  if (number < 1000000) {
    divisor = 1000;
    suffix = 'K';
  } else if (number < 1000000000) {
    divisor = 1000000;
    suffix = 'M';
  } else if (number < 1000000000000) {
    divisor = 1000000000;
    suffix = 'B';
  } else {
    divisor = 1000000000000;
    suffix = 'T';
  }

  double val = number / divisor;
  return val.toStringAsFixed(val % 1 == 0 ? 0 : 1) + suffix;
}

double getListOfDoublesSum(List<double> items) {
  double sum = 0.0;
  for (var item in items) {
    sum += item;
  }
  return sum;
}
