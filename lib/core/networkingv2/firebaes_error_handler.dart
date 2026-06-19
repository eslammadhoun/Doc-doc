import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_complete_project/core/networkingv2/api_error_model.dart';

class FirebaesErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is FirebaseException) {
      switch (error.code) {
        case 'permission-denied':
          return ApiErrorModel(
            message: 'You don\'t have permission to do this.',
          );
        case 'unavailable':
          return ApiErrorModel(message: 'No internet connection.');
        case 'not-found':
          return ApiErrorModel(message: 'Conversation not found.');
        default:
          return ApiErrorModel(
            message:
                'Something went wrong, please try again later., ${error.message}',
          );
      }
    }
    return ApiErrorModel(
      message: 'Something went wrong, please try again later.',
    );
  }
}
