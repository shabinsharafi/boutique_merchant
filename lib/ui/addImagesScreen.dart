import 'dart:io';

import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/common/state_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/items.dart';
import '../widgets/toolbar.dart';

class AddImageScreen extends ScreenWidget {
  AddImageScreen(this.item, {Key? key}) : super(key: key);
  Item item;

  @override
  ScreenState<AddImageScreen> getState() => _AddImageScreenState();
}

class _AddImageScreenState extends ScreenState<AddImageScreen> {
  final ImagePicker _picker = ImagePicker();

  Map<int, File> offlineImages = Map();

  var uploading = -1;

  @override
  Widget getWidget(BuildContext context) {
    return Column(
      children: [
        ToolBar("Add Item"),
        Padding(
          padding: EdgeInsets.all(Styles.dimens.screenPadding),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15,childAspectRatio: Styles.dimens.itemImageRatio),
            shrinkWrap: true,
            children: [
              for (int i = 0;
                  i <
                      (widget.item.images ?? []).length +
                          offlineImages.length +
                          1;
                  i++)
                imageView(
                  i,
                  widget.item.images ?? [],
                )
            ],
          ),
        ),
      ],
    );
  }

  imageView(int i, List<String> imagePath) {
    var width =
        (Styles.dimens.width - (Styles.dimens.screenPadding * 2) - 30) / 3;
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          color: Color(0x12000000), borderRadius: BorderRadius.circular(20)),
      child: imagePath.length > i
          ? Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.network(imagePath[i])),
                Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 20,
                        ))),
              ],
            )
          : offlineImages[i] != null
              ? Stack(
                  children: [
                    Image.file(offlineImages[i]!),
                    if (uploading == i)
                      Center(child: CircularProgressIndicator())
                  ],
                )
              : InkWell(
                  onTap: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    final File file = File(pickedFile!.path);
                    setState(() {
                      offlineImages.update(i, (value) => file,
                          ifAbsent: () => file);
                    });
                    uploadImage(i);
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
    );
  }

  Future<void> uploadImage(int i) async {
    setState(() {
      uploading = i;
    });
    /*var reference = FirebaseStorage.instance.ref().child(
        'petsImages/${path.basename(offlineImages[i].path)}'); // Modify this path/string as your need
    TaskSnapshot uploadTask = await reference.putFile(offlineImages[i]);

    final link = await uploadTask.ref
        .getDownloadURL(); */ /*await reference.getDownloadURL();*/ /*
    print("Download URL: $link");
    await Provider.of<MyPetsDetailsViewModel>(context, listen: false)
        .updateImage(link);
    setState(() {
      uploading = -1;
    });*/
  }
}
