import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/provider/authVM.dart';
import 'package:boutique_merchant/ui/authScreen/loginScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBoutiqueScreen extends StatefulWidget {
  const AddBoutiqueScreen({Key? key}) : super(key: key);

  @override
  State<AddBoutiqueScreen> createState() => _AddBoutiqueScreenState();
}

class _AddBoutiqueScreenState extends State<AddBoutiqueScreen> {
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ToolBar("Add Boutique"),
      body: Consumer<AuthenticationProvider>(
          builder: (context, provider, child) {
        return Padding(
          padding: Styles.normalScreenPadding,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.spaceHeight70,
                Center(
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: Styles.color.textColorHint,
                  ),
                ),
                Styles.spaceHeight30,
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
                Styles.spaceHeight50,
                PrimaryButton(
                  "Create Boutique",
                  onTap: () {
                    provider.login();
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
