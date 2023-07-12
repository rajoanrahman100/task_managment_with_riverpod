import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_managment_with_riverpod/common/helpers/db_helper.dart';
import 'package:task_managment_with_riverpod/common/routes/routes.dart';
import 'package:task_managment_with_riverpod/common/widgets/showDialog.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(auth: FirebaseAuth.instance);
});

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository({required this.auth});

  void verifyOtp(
      {required BuildContext context, required String smsCodeID, required String smsCode, required bool mounted}) async {
    try {
      final credential = PhoneAuthProvider.credential(verificationId: smsCodeID, smsCode: smsCode);

      await auth.signInWithCredential(credential);

      if (!mounted) {
        return;
      }

      Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (Route<dynamic> route) => false);
    } on FirebaseAuth catch (e) {
      debugPrint("Error ${e.toString()}");

      showAlertDialog(context: context, message: e.toString());
    }
  }

  void sendOtp({required BuildContext context, required String phone}) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            showAlertDialog(context: context, message: e.toString());
          },
          codeSent: (smsCodeId, resendCodeId) {
            DBHelper.createUser(1);
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (Route<dynamic> route) => false,
                arguments: {'phone': phone, 'smsCodeId': smsCodeId});
          },
          codeAutoRetrievalTimeout: (String smsCodeId) {});
    } on FirebaseAuth catch (e) {
      debugPrint("Error ${e.toString()}");
      showAlertDialog(context: context, message: e.toString());
    }
  }
}
