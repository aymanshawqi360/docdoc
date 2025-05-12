import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class ApiErrorHandler {
  static ApiErrorModel apiHundle(dynamic e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.cancel:
          return ApiErrorModel(
              error: "The request was cancelled before being sent.");

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
              error:
                  "Connection to the server timed out. Please try again later.");

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              error: "Sending data took too long. Please try again.");

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(error: "The app couldn't receive data in time.");

        case DioExceptionType.badCertificate:
          return ApiErrorModel(
              error:
                  "There is a problem with the server's security certificate.");

        case DioExceptionType.badResponse:
          return errorHundle(e.response?.data);

        case DioExceptionType.connectionError:
          return ApiErrorModel(
              error: "Please check your internet connection and try again.");

        case DioExceptionType.unknown:
          return ApiErrorModel(
              error: "An unexpected error occurred. Please try again.");
      }
    } else {
      return ApiErrorModel(error: "Unknown error occurred");
    }
  }

  static ApiErrorModel errorHundle(dynamic data) {
    return ApiErrorModel(error: data.toString());
  }

  //It is  errors  firebase

  static ApiErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case "too-many-requests":
            return ApiErrorModel(
                error:
                    "This device has been temporarily blocked. Please try again later.");
          case 'invalid-credential':
            return ApiErrorModel(
              error:
                  "There is an issue with the login credentials: they may be incorrect, expired, or the password is weak.",
            );
          case 'operation-not-allowed':
            return ApiErrorModel(
                error:
                    "Google Sign-In is not enabled in your Firebase settings.");
          case 'account-exists-with-different-credential':
            return ApiErrorModel(
                error:
                    "An account already exists with this email using a different sign-in method.");
          case 'invalid-email':
            return ApiErrorModel(
              error: "The email address is not valid.",
            );
          case 'user-disabled':
            return ApiErrorModel(
              error: "This user account has been disabled.",
            );
          case 'user-not-found':
            return ApiErrorModel(
              error: "No account found with this email.",
            );
          case 'wrong-password':
            return ApiErrorModel(error: "The password is incorrect.");
          case 'email-already-in-use':
            return ApiErrorModel(
              error: "This email is already in use.",
            );
          case 'weak-password':
            return ApiErrorModel(error: "The password is too weak.");
          case 'network-request-failed':
            return ApiErrorModel(
              error: "Please check your internet connection and try again.",
            );
          case 'invalid-verification-code':
            return ApiErrorModel(error: "The verification code is incorrect.");
          case 'invalid-verification-id':
            return ApiErrorModel(error: "The verification ID is invalid.");
          case 'credential-already-in-use':
            return ApiErrorModel(
                error: "These credentials are already in use.");
          case 'requires-recent-login':
            return ApiErrorModel(
                error: "Recent login is required to perform this operation.");
          case 'user-mismatch':
            return ApiErrorModel(
                error:
                    "The provided credentials do not match the current user.");
          case 'expired-action-code':
            return ApiErrorModel(error: "The action code has expired.");
          case 'invalid-action-code':
            return ApiErrorModel(
              error: "The action code is invalid.",
            );
          case 'session-expired':
            return ApiErrorModel(
                error: "The session has expired. Please try again.");
          case 'missing-verification-code':
            return ApiErrorModel(
              error: "The verification code was not entered.",
            );
          case 'internal-error':
            return ApiErrorModel(
                error: "An internal error occurred. Please try again.");
          case 'sign_in_failed':
            return ApiErrorModel(error: "Sign-in failed. Please try again.");
          default:
            return ApiErrorModel(
                error: "An unexpected error occurred. Please try again later.");
        }
      } else if (e is PlatformException) {
        final code = e.code;
        final details = e.details?.toString();
        final message = e.message ?? '';
        if (code == 'network_error ' ||
            message.contains('7:') ||
            details == '7') {
          return ApiErrorModel(
            error:
                "Failed to connect to the server (check your internet connection).",
          );
        } else if (details == '8') {
          return ApiErrorModel(
            error: "Unknown service name (DNS issue).",
          );
        } else if (details == '101') {
          return ApiErrorModel(
            error: "Network unavailable (no Wi-Fi or mobile data connection).",
          );
        } else if (details == '110') {
          return ApiErrorModel(
            error: "Connection timeout (server did not respond).",
          );
        } else if (details == '111') {
          return ApiErrorModel(
            error: "Server refused the connection (might be unavailable).",
          );
        } else if (details == '113') {
          return ApiErrorModel(
            error: "No route to server (network issues).",
          );
        } else if (details == '-2') {
          return ApiErrorModel(
            error: "Temporary failure in name resolution (DNS error).",
          );
        } else if (details == 'ERROR_NETWORK_REQUEST_FAILED' || code.isEmpty) {
          return ApiErrorModel(
            error:
                "Failed to connect to the server (check your internet connection).",
          );
        }
      }
    }
    log(e.toString());
    return ApiErrorModel(error: " خطأ غير متوقع: ${e.toString()}");
  }
}
 







  // if (e is FirebaseAuthException) {
      //   switch (e.code) {
      //     case 'invalid-email':
      //       return ApiErrorModel(error: '📧 البريد الإلكتروني غير صالح.');
      //     case 'user-disabled':
      //       return ApiErrorModel(error: '🚫 هذا المستخدم تم تعطيله.');
      //     case 'user-not-found':
      //       return ApiErrorModel(
      //           error: '❌ لا يوجد حساب مرتبط بهذا البريد.');
      //     case 'wrong-password':
      //       return ApiErrorModel(error: '🔑 كلمة المرور غير صحيحة.');
      //     case 'email-already-in-use':
      //       return ApiErrorModel(error: '📌 البريد مستخدم مسبقًا.');
      //     case 'weak-password':
      //       return ApiErrorModel(error: '🔐 كلمة المرور ضعيفة جدًا.');
      //     default:
      //       return ApiErrorModel(error: e.message ?? 'حدث خطأ غير معروف.');
      //   }
        
      // }