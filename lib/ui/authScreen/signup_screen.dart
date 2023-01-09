import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/authScreen/authVM.dart';
import 'package:boutique_merchant/ui/authScreen/loginScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<AuthenticationViewModel>(
            builder: (context, provider, child) {
          return Padding(
            padding: Styles.normalScreenPadding,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Signup",
                      style: Styles.textStyle.headingTS,
                    ),
                  ),
                  Styles.spaceHeight70,
                  Text(
                    "Name",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: Styles.inputForm(),
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Phone Number",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: Styles.inputForm(),
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Email",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: Styles.inputForm(),
                  ),
                  Styles.spaceHeight50,
                  PrimaryButton(
                    "Create Account",
                    onTap: () {
                      provider.login();
                    },
                  ),
                  Styles.spaceHeight50,
                  RichText(
                      text: TextSpan(
                          text: "Already a member? ",
                          style: Styles.textStyle.normalTS,
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {
                              /*NavigationService.changeScreen(
                                  LoginScreen());*/
                              NavigationService.close();
                            },
                            text: "Login",
                            style: Styles.textStyle.normalBoldTS
                                .copyWith(color: Styles.color.primaryColor))
                      ])),
                  Container(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}