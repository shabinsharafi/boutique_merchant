import 'package:boutique_merchant/provider/authVM.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/authScreen/signup_screen.dart';
import 'package:boutique_merchant/ui/authScreen/verify_otp_screen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/utils/validations.dart';
import 'package:boutique_merchant/widgets/AnimatedButtonLoader.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Styles.normalScreenPadding,
          child: Consumer<AuthenticationProvider>(
              builder: (context, provider, child) {
            return Form(
              key: provider.mobileFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Center(
                    child: Text(
                      "Login",
                      style: Styles.textStyle.tooBigHeadingTS,
                    ),
                  ),
                  SizedBox(height: 100,),
                  Text(
                    "Phone Number",
                    style: Styles.textStyle.normalBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: provider.phoneNumberController,
                    autovalidateMode: provider.autoValidateMode,
                    decoration: Styles.inputForm(),
                    validator: (value) => Validations.phone(value!),
                  ),
                  Styles.spaceHeight50,
                  AnimatedButtonLoader(
                    loading: provider.isLoginLoading,
                    child: PrimaryButton(
                      "Login",
                      onTap: () {
                        provider.login();
                      },
                    ),
                  ),
                  Styles.spaceHeight50,
                  RichText(
                      text: TextSpan(
                          text: "Not yet registered? ",
                          style: Styles.textStyle.normalTS,
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                NavigationService.changeScreen(
                                   SignupScreen());
                              },
                            text: "Create Account",
                            style: Styles.textStyle.normalBoldTS
                                .copyWith(color: Styles.color.primaryColor))
                      ])),
                  Container(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
