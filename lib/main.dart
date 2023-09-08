import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task_managment_with_riverpod/common/models/user_model.dart';
import 'package:task_managment_with_riverpod/common/routes/routes.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/features/auth/controller/user_controller.dart';
import 'package:task_managment_with_riverpod/features/onboarding/pages/onboarding.dart';
import 'package:task_managment_with_riverpod/features/todo/pages/homepage.dart';

import 'notification_permission.dart';

//flutter pub run build_runner watch

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final defaultDarkColorScheme = ColorScheme.fromSwatch(primarySwatch: Colors.blue, brightness: Brightness.dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    ref.read(userProvider.notifier).refresh(); ///Fetching the user list from local db

    List<UserModel> users=ref.watch(userProvider);

    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
            return MaterialApp(
              title: 'TODO',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: AppConst.kBkDark,
                  useMaterial3: true,
                  colorScheme: lightColorScheme ?? defaultLightColorScheme),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                scaffoldBackgroundColor: AppConst.kBkDark,
                useMaterial3: true,
              ),
              themeMode: ThemeMode.dark,
              onGenerateRoute: Routes.onGenerateRoute,
              home: users.isEmpty?OnBoarding():HomePage(),
            );
          });
        });
  }
}
