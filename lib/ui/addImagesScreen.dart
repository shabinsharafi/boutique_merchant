import 'dart:io';

import 'package:boutique_merchant/models/itemImage.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/common/state_screen.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/items.dart';
import '../provider/addItemProvider.dart';
import '../widgets/toolbar.dart';

class AddImageScreen extends ScreenWidget {
  AddImageScreen(this.item, {Key? key}) : super(key: key);
  Item item;

  @override
  ScreenState<AddImageScreen> getState() => _AddImageScreenState();
}

class _AddImageScreenState extends ScreenState<AddImageScreen> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var provider = Provider.of<AddItemProvider>(context, listen: false);
    provider.offlineImages.clear();
    provider.uploading.clear();
  }

  @override
  Widget getWidget(BuildContext context) {
    return Column(
      children: [
        ToolBar("Add Item"),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(Styles.dimens.screenPadding),
            child:
                Consumer<AddItemProvider>(builder: (context, provider, child) {
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: Styles.dimens.itemImageRatio),
                shrinkWrap: true,
                children: [
                  for (int i = 0;
                      i <
                          (widget.item.images ?? []).length +
                              provider.offlineImages.length +
                              1;
                      i++)
                    imageView(i, widget.item.images ?? [], provider)
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  imageView(int i, List<ItemImage> imagePath, AddItemProvider provider) {
    var width =
        (Styles.dimens.width - (Styles.dimens.screenPadding * 2) - 30) / 3;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(color: Color(0x12000000)),
        child: imagePath.length > i
            ? Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: NetworkImageShimmer(imagePath[i].url!)),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: (){
                          provider.deleteImage(i);
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            )),
                      )),
                ],
              )
            : provider.offlineImages[i] != null
                ? Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Image.file(provider.offlineImages[i]!)),
                      if (provider.uploading.contains(i))
                        Container(
                            color: Colors.black38,
                            child: Center(child: CircularProgressIndicator()))
                    ],
                  )
                : InkWell(
                    onTap: () async {
                      final pickedFile =
                          await _picker.pickImage(source: ImageSource.gallery);
                      final File file = File(pickedFile!.path);

                      CroppedFile? croppedFile = await ImageCropper().cropImage(
                        sourcePath: file.path ?? "",
                        aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 4),
                        aspectRatioPresets: [
                          CropAspectRatioPreset.ratio5x3,
                          CropAspectRatioPreset.square,
                          CropAspectRatioPreset.ratio4x3,
                          CropAspectRatioPreset.ratio16x9,
                        ],
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
                      if(croppedFile==null||croppedFile.path==null){
                        return;
                      }
                      provider.offlineImages.update(
                          i, (value) => File(croppedFile?.path ?? ""),
                          ifAbsent: () => File(croppedFile?.path ?? ""));

                      provider.uploadImage(i, widget.item.id);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Styles.color.primaryColor,
                        ),
                        Text(
                          "Add image",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Styles.color.primaryColor,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
