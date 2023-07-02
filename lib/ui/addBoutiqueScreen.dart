import 'package:boutique_merchant/provider/boutiqueVM.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBoutiqueScreen extends StatefulWidget {
  const AddBoutiqueScreen({Key? key}) : super(key: key);

  @override
  State<AddBoutiqueScreen> createState() => _AddBoutiqueScreenState();
}

class _AddBoutiqueScreenState extends State<AddBoutiqueScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ToolBar("Add Boutique"),
      body: Consumer<BoutiqueProvider>(
          builder: (context, provider, child) {
        return Padding(
          padding: Styles.normalScreenPadding,
          child: Form(
            key: provider.formKey,
            child: SingleChildScrollView(
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
                    controller: provider.nameController,
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
                    controller: provider.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: Styles.inputForm(),
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Email Id",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    controller: provider.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: Styles.inputForm(),
                  ),
                  Styles.spaceHeight50,
                  PrimaryButton(
                    "Create Boutique",
                    onTap: () {
                      provider.addBoutique();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
