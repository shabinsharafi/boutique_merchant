import 'dart:io';

import 'package:boutique_merchant/provider/boutiqueVM.dart';
import 'package:boutique_merchant/provider/userProvider.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/utils/validations.dart';
import 'package:boutique_merchant/widgets/AnimatedButtonLoader.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditBoutiqueScreen extends StatefulWidget {
  const EditBoutiqueScreen({Key? key}) : super(key: key);

  @override
  State<EditBoutiqueScreen> createState() => _EditBoutiqueScreenState();
}

class _EditBoutiqueScreenState extends State<EditBoutiqueScreen> {
  final ImagePicker _picker = ImagePicker();

  late UserProvider userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<BoutiqueProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    provider.nameController.text = userProvider.user.merchant!.name!;
    provider.phoneNumberController.text = userProvider.user.merchant!.phone!;
    provider.emailController.text = userProvider.user.merchant!.email!;
    provider.image = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ToolBar("Edit Boutique"),
      body: Consumer<BoutiqueProvider>(builder: (context, provider, child) {
        return Padding(
          padding: Styles.normalScreenPadding,
          child: Form(
            key: provider.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.spaceHeight30,
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Styles.color.textColorHint,
                            child: provider.image==null&&userProvider.user.merchant?.image != null
                                ? NetworkImageShimmer(
                                    userProvider.user.merchant?.image)
                                : provider.image != null
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.file(provider.image!),
                                          CircularProgressIndicator(),
                                        ],
                                      )
                                    : InkWell(
                                        onTap: () {
                                          pickImage(provider);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.image_outlined,
                                              size: 40,
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Add Image",
                                              style:
                                                  Styles.textStyle.smallBoldTS,
                                            )
                                          ],
                                        ),
                                      ),
                          ),
                        ),
                        if (userProvider.user.merchant?.image != null)
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                pickImage(provider);
                              },
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.edit,
                                  size: 28,
                                ),
                                radius: 25,
                              ),
                            ),
                          )
                      ],
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
                    validator: (value) => Validations.required(value!),
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
                    validator: (value) => Validations.phone(value!),
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
                    validator: (value) => Validations.email(value!),
                  ),
                  Styles.spaceHeight50,
                  AnimatedButtonLoader(
                    loading: provider.isBoutiqueCreateLoading,
                    child: PrimaryButton(
                      "Update Boutique",
                      onTap: () {
                        provider.updateBoutique();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void pickImage(BoutiqueProvider provider) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    final File file = File(pickedFile!.path);

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path ?? "",
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      maxHeight: 350,
      maxWidth: 350,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop',
            toolbarColor: Styles.color.primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Crop',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    // provider.imageFile = File(croppedFile?.path ?? "");
    // List<int> bytes = await
    // File(provider.imageFile?.path ?? "").readAsBytes();
    if (croppedFile == null) {
      return;
    }
    provider.image = File(croppedFile.path ?? "");
    provider.uploadImage();
  }
}
