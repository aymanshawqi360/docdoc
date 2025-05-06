import 'dart:developer';

import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case "too-many-requests":
            return ApiErrorModel(
                error: "تم حظر الجهاز مؤقتًا. الرجاء المحاولة لاحقًا. ");
          case 'invalid-credential':
            return ApiErrorModel(
              error:
                  " توجد مشكلة في بيانات تسجيل الدخول: قد تكون غير صحيحة، منتهية، أو كلمة المرور ضعيفة. ",
            );
          case 'operation-not-allowed':
            return ApiErrorModel(
                error:
                    " تسجيل الدخول باستخدام Google غير مفعل في إعدادات Firebase.");
          case 'account-exists-with-different-credential':
            return ApiErrorModel(
                error:
                    " حساب مرتبط بهذا البريد الإلكتروني باستخدام طريقة تسجيل مختلفة.");
          case 'invalid-email':
            return ApiErrorModel(
              error: " البريد الإلكتروني غير صالح.",
            );
          case 'user-disabled':
            return ApiErrorModel(
              error: " هذا المستخدم تم تعطيله.",
            );

          case 'user-not-found':
            return ApiErrorModel(
              error: " لا يوجد حساب مرتبط بهذا البريد.",
            );
          case 'wrong-password':
            return ApiErrorModel(error: "🔑 كلمة المرور غير صحيحة.");
          case 'email-already-in-use':
            return ApiErrorModel(
              error: " البريد مستخدم مسبقًا.",
            );
          case 'weak-password':
            return ApiErrorModel(error: "كلمة المرور ضعيفة جدًا.");

          case 'too-many-requests':
            return ApiErrorModel(
                error: " عدد محاولات تسجيل الدخول كبير جدًا. حاول لاحقًا.");
          case 'network-request-failed':
            return ApiErrorModel(
              error: " تأكد من اتصال الإنترنت وحاول مرة أخرى.",
            );

          case 'invalid-verification-code':
            return ApiErrorModel(error: " رمز التحقق غير صحيح.");
          case 'invalid-verification-id':
            return ApiErrorModel(error: "رمز التحقق من الهوية غير صالح.");

          case 'credential-already-in-use':
            return ApiErrorModel(error: "بيانات الاعتماد مستخدمة مسبقاً.");
          case 'requires-recent-login':
            return ApiErrorModel(
                error: "يلزم تسجيل الدخول مؤخرًا للقيام بهذه العملية.");
          case 'user-mismatch':
            return ApiErrorModel(
                error: " بيانات الاعتماد لا تتطابق مع المستخدم الحالي.");
          case 'expired-action-code':
            return ApiErrorModel(error: " رمز الإجراء منتهي.");
          case 'invalid-action-code':
            return ApiErrorModel(
              error: " رمز الإجراء غير صالح.",
            );
          case 'session-expired':
            return ApiErrorModel(error: " انتهت صلاحية الجلسة، حاول مرة أخرى.");
          case 'missing-verification-code':
            return ApiErrorModel(
              error: "لم يتم إدخال رمز التحقق.",
            );

          case 'internal-error':
            return ApiErrorModel(
                error: " حدث خطأ داخلي في النظام. حاول مرة أخرى.");

          case 'sign_in_failed':
            return ApiErrorModel(error: " فشل تسجيل الدخول. حاول مرة أخرى.");

          default:
            return ApiErrorModel(error: " حدث خطأ ما. حاول مرة أخرى لاحقًا.");
        }
      } else if (e is PlatformException) {
        final code = e.code;
        final details = e.details?.toString();
        final message = e.message ?? '';
        if (code == 'network_error ' ||
            message.contains('7:') ||
            details == '7') {
          return ApiErrorModel(
            error: " فشل في الاتصال بالخادم (تحقق من الاتصال بالإنترنت)",
          );
        } else if (details == '8') {
          return ApiErrorModel(
            error: " اسم الخدمة غير معروف (مشكلة DNS)",
          );
        } else if (details == '101') {
          return ApiErrorModel(
            error: "الشبكة غير متاحة (لا يوجد اتصال Wi-Fi أو بيانات)",
          );
        } else if (details == '110') {
          return ApiErrorModel(
            error: "مهلة الاتصال انتهت (الخادم لم يستجب)",
          );
        } else if (details == '111') {
          return ApiErrorModel(
            error: " الخادم رفض الاتصال (قد يكون غير متاح)",
          );
        } else if (details == '113') {
          return ApiErrorModel(
            error: "لا يوجد طريق للوصول إلى الخادم (مشاكل في الشبكة)",
          );
        } else if (details == '-2') {
          return ApiErrorModel(error: "فشل مؤقت في تحليل اسم النطاق (DNS)");
        } else if (details == 'ERROR_NETWORK_REQUEST_FAILED' || code.isEmpty) {
          return ApiErrorModel(
            error: " فشل في الاتصال بالخادم (تحقق من الاتصال بالإنترنت)",
          );
        }
      }
      // } else if (e == 'permission_denied') {
      //   return ApiErrorModel(
      //     error:
      //         LocaleKeys.FirebaseErrorFacebook_FacebookAccountAccessDenied.tr(),
      //   );
      // } else if (e == 'login_failed') {
      //   return ApiErrorModel(
      //     error: LocaleKeys
      //         .FirebaseErrorFacebook_FacebookLoginFailedCheckAppSettings.tr(),
      //   );
      // } else if (e == 'app_not_set_up') {
      //   return ApiErrorModel(
      //     error: LocaleKeys
      //             .FirebaseErrorFacebook_TheAppIsNotSetUpOnTheFacebookDeveloperConsole
      //         .tr(),
      //   );
      // } else if (e == 'invalid_key_hash') {
      //   return ApiErrorModel(
      //     error: LocaleKeys
      //             .FirebaseErrorFacebook_TheKeyIsIncorrectMakeSureYouAddedTheCorrectkeyHashInYourFacebookSettings
      //         .tr(),
      //   );
      // } else if (e == 'access_denied') {
      //   return ApiErrorModel(
      //       error: LocaleKeys.FirebaseErrorFacebook_FacebookAccountAccessDenied
      //           .tr());
      // } else {
      //   return ApiErrorModel(
      //     error: '💥 حدث استثناء غير معروف: ${e.toString()}',
      //   );
      // }

      // log("message-================${e.toString()}");
      // return ApiErrorModel(error: e.toString());
    }
    log(e.toString());
    return ApiErrorModel(error: "🚨 خطأ غير متوقع: ${e.toString()}");
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