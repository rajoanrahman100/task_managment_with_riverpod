import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/features/todo/pages/homepage.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'TODO',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: AppConst.kBkDark, useMaterial3: true),
            themeMode: ThemeMode.dark,
            home: HomePage(),
          );
        });
  }
}
