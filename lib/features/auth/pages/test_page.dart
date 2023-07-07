import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';
import 'package:task_managment_with_riverpod/common/widgets/reusabletext.dart';
import 'package:task_managment_with_riverpod/features/auth/controller/code_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var code = ref.watch(codeStateProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ReusableText(text: code, style: appStyle(30, AppConst.kGreen, FontWeight.bold)),
            TextButton(
                onPressed: () {
                  ref.read(codeStateProvider.notifier).setStart("Hello World");
                },
                child: Text("Press Me"))
          ],
        ),
      ),
    );
  }
}
