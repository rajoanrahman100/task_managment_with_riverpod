import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';
import 'package:task_managment_with_riverpod/common/widgets/custom_outline_btn.dart';
import 'package:task_managment_with_riverpod/common/widgets/height_spacer.dart';
import 'package:task_managment_with_riverpod/common/widgets/reusabletext.dart';

import '../../../common/widgets/custom_text_field.dart';
import 'otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  Country country = Country(
      phoneCode: "+88",
      countryCode: "BD",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "BD",
      example: "BD",
      displayName: "Bangladesh",
      displayNameNoCountryCode: "BD",
      e164Key: "");

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
  }

  @override
  Widget build(BuildContext context) {
    // We can also use "ref" to listen to a provider inside the build method
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Image.asset(
                "assets/images/todo.png",
                width: 300,
              ),
            ),
            HeightSpacer(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w),
              child: ReusableText(
                text: "Please enter your phone number",
                style: appStyle(17, AppConst.kLight, FontWeight.w500),
              ),
            ),
            HeightSpacer(height: 20),
            Center(
              child: CustomTextField(
                controller: phoneController,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kLight,
                              bottomSheetHeight: AppConst.kHeight * 0.6,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppConst.kRadius),
                                topRight: Radius.circular(AppConst.kRadius),
                              )),
                          onSelect: (code) {
                            setState(() {});
                          });
                    },
                    child: ReusableText(
                      text: "${country.flagEmoji}  ${country.phoneCode}",
                      style: appStyle(
                        18,
                        AppConst.kBkDark,
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                textInputType: TextInputType.number,
                hintText: "Enter phone number",
                hintStyle: appStyle(16, AppConst.kBkDark, FontWeight.w600),
              ),
            ),
            HeightSpacer(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomOutlineBtn(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage()));
                },
                width: AppConst.kWidth * 0.9,
                height: AppConst.kHeight * 0.07,
                color2: AppConst.kLight,
                color1: AppConst.kBkDark,
                text: "Send Code",
              ),
            )
          ],
        ),
      )),
    );
  }
}
