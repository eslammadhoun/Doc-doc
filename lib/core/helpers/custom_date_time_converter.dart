import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateFormat('EEEE, MMMM d, yyyy h:mm a').parse(json);
  }

  @override
  String toJson(DateTime date) {
    return DateFormat('EEEE, MMMM d, yyyy h:mm a').format(date);
  }
}
