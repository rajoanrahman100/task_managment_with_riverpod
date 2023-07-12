
import 'package:flutter/material.dart';
import 'package:task_managment_with_riverpod/features/auth/pages/login_page.dart';
import 'package:task_managment_with_riverpod/features/auth/pages/otp_page.dart';
import 'package:task_managment_with_riverpod/features/onboarding/pages/onboarding.dart';
import 'package:task_managment_with_riverpod/features/todo/pages/homepage.dart';

class Routes{
  static const String onBoarding='onboarding';
  static const String login='login';
  static const String otp='otp';
  static const String home='home';

  static Route<dynamic> onGenerateRout(RouteSettings settings){
    switch (settings.name){
      case onBoarding:
        return MaterialPageRoute(builder: (context)=>OnBoarding());
      case login:
        return MaterialPageRoute(builder: (context)=>LoginPage());
      case home:
        return MaterialPageRoute(builder: (context)=>HomePage());
      case otp:
        final Map args=settings.arguments as Map;
        return MaterialPageRoute(builder: (context)=>OtpPage(smsCodeId: args['smsCodeId'], phone: args['phone']));

      default:
      return MaterialPageRoute(builder: (context)=>HomePage());
    }
  }
}