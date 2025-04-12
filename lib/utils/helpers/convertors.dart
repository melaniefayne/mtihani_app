import 'package:intl/intl.dart';

String? getApiDateTime(DateTime? dateTime) {
  if (dateTime == null) return null;
  return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
}
