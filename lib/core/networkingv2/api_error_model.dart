import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;
  ApiErrorModel({this.message, this.code, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// returns A String containing all the error messages
  String getAllMessages() {
    if (errors.isNullOrEmpty()) return message ?? 'UnKnown Error Occurred';

    final errorMessages = errors!.entries
        .map((entry) {
          final value = entry.value;
          if (value is List<dynamic>) {
            return value.join(', ');
          }

          return value.toString();
        })
        .join('\n');
    return errorMessages;
  }
}
