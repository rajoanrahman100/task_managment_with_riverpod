import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_managment_with_riverpod/features/auth/repositories/auth_repository.dart';

final authController = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  void verifyOtp({required BuildContext context, required String smsCodeID, required String smsCode, required bool mounted}) {
    authRepository.verifyOtp(context: context, smsCodeID: smsCodeID, smsCode: smsCode, mounted: mounted);
  }

  void sendSms({required BuildContext context, required String phone}){
    authRepository.sendOtp(context: context, phone: phone);
  }
}
