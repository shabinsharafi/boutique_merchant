import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/constants/constants.dart';
import 'package:boutique_merchant/models/favourite.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/ui/addImagesScreen.dart';
import 'package:boutique_merchant/ui/common/state_screen.dart';
import 'package:boutique_merchant/ui/editItemScreen.dart';
import 'package:boutique_merchant/ui/reviewsScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/utils/extension.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/PrimaryOutline.dart';
import 'package:boutique_merchant/widgets/SettingButton.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../styles/styles.dart';

class ItemDetailScreen extends ScreenWidget {
  ItemDetailScreen(this.item, {Key? key}) : super(key: key);
  Item item;

  @override
  ScreenState<ScreenWidget> getState() {
    return _ItemDetailScreenState();
  }
}

class _ItemDetailScreenState extends ScreenState<ItemDetailScreen> {
  var selectedImage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ItemsProvider>(context,listen: false).itemDetailsResponse=ApiResponse(data:widget.item);
    Provider.of<ItemsProvider>(context,listen: false).getItemDetails(widget.item.id);
  }
  @override
  Widget getWidget(BuildContext context) {
    return Scaffold(
      // appBar: ToolBar("",action: InkWell(onTap:(){
      //
      // },child: Icon(Icons.heart_broken))),
      body: Consumer<ItemsProvider>(builder: (context, provider, child) {
        return Column(
          children: [
            ToolBar(
              "",
              isLight: false,
              action: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                    onTap: () {}, child: Icon(FontAwesomeIcons.shareSquare)),
              ),
              color: Colors.white,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  return await Provider.of<ItemsProvider>(context, listen: false).getItemDetails(widget.item.id);
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: Styles.dimens.screenPadding,
                          right: Styles.dimens.screenPadding,
                          top: Styles.dimens.screenPadding,
                        ),
                        child: AspectRatio(
                          aspectRatio: Styles.dimens.itemDetailImageRatio,
                          child: SizedBox(
                            width: Styles.dimens.width,
                            child: Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: Styles.dimens.itemDetailImageRatio,
                                  child: (provider.itemDetailsResponse!.data!.images != null &&
                                          provider.itemDetailsResponse!.data!.images!.isNotEmpty)
                                      ? NetworkImageShimmer(
                                          (provider.itemDetailsResponse!.data!.images != null &&
                                                  provider.itemDetailsResponse!.data!.images!.isNotEmpty)
                                              ? provider.itemDetailsResponse!.data!.images![selectedImage].url
                                              : "",
                                          fit: BoxFit.cover,
                                        )
                                      : Center(
                                          child: Nothing(
                                            "No Images.\nItems without images will not\nbe listed to customers",
                                            title: "Add Images",
                                            onClick: () {
                                              NavigationService.changeScreen(
                                                  AddImageScreen(provider.itemDetailsResponse!.data!));
                                            },
                                          ),
                                        ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(),
                                ),
                                if (provider.itemDetailsResponse!.data!.images != null)
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: LayoutBuilder(
                                        builder: (context, constraints) {
                                      var width = constraints.maxWidth;
                                      var imageWidth = (width - 60) / 5;
                                      return Container(
                                        margin:
                                            EdgeInsets.only(left: 10, bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            for (int i = 0;
                                                i < provider.itemDetailsResponse!.data!.images!.length;
                                                i++)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedImage = i;
                                                    });
                                                  },
                                                  child: Material(
                                                    elevation: 20,
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    child: Container(
                                                      width: imageWidth,
                                                      height: imageWidth,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color: Styles.color
                                                                  .secondaryColor,
                                                              width: i ==
                                                                      selectedImage
                                                                  ? 1.5
                                                                  : 0)),
                                                      child: NetworkImageShimmer(
                                                        provider.itemDetailsResponse!.data!.images![i].url,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ],
                                        ),
                                      );
                                    }),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: Styles.dimens.screenPadding,
                          right: Styles.dimens.screenPadding,
                          top: Styles.dimens.screenPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              provider.itemDetailsResponse!.data!.name!,
                              style: Styles.textStyle.headingBoldTS,
                            ),
                            Text(
                              provider.itemDetailsResponse!.data!.category!.name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle.smallTS,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "$rupeeSymbol ${provider.itemDetailsResponse!.data!.price.toString()}",
                                  style: Styles.textStyle.headingBoldTS,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            if (provider.itemDetailsResponse!.data!.merchant != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: MerchantProp(provider.itemDetailsResponse!.data!.merchant!),
                              ),
                            Text(
                              "Colors",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle.normalBoldTS,
                            ),
                            Row(
                              children: provider.itemDetailsResponse!.data!.colors!
                                  .map((element) => Container(
                                        width: 30,
                                        height: 30,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white
                                                .parseColor(element.color!)),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Material Type",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle.normalBoldTS,
                            ),
                            Text(
                              provider.itemDetailsResponse!.data!.materialType!.name!,
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle.smallTS,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Description",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle.normalBoldTS,
                            ),
                            Text(
                              provider.itemDetailsResponse!.data!.description!,
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle.smallTS,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SettingsButton("Reviews", () {
                              NavigationService.changeScreen(ReviewsScreen(provider.itemDetailsResponse!.data!));
                            }),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Styles.dimens.screenPadding),
              child: Row(
                children: [
                  Expanded(
                      child: PrimaryButton(
                    "Add Image",
                    onTap: () {
                      NavigationService.changeScreen(
                          AddImageScreen(provider.itemDetailsResponse!.data!));
                    },
                    paddingTop: 0,
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: PrimaryButton(
                    "Edit Item",
                    onTap: () async {
                      var result=NavigationService.changeScreen(
                          EditItemScreen(provider.itemDetailsResponse!.data!));
                      print(result);
                      if(result){
                        await Provider.of<ItemsProvider>(context,listen: false).getItemDetails(provider.itemDetailsResponse!.data!.id);
                        provider.itemDetailsResponse!.data!=provider.itemDetailsResponse!.data!;
                        setState(() {

                        });
                      }
                    },
                    paddingTop: 0,
                  )),
                  /*Expanded(
                      child: PrimaryButton("Buy Now", onTap: () {
                    provider.buyNow(provider.itemDetailsResponse!.data!.id);
                  })),*/
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class MerchantProp extends StatelessWidget {
  MerchantProp(this.merchant);

  Merchant merchant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NetworkImageShimmer(
          merchant.image,
          height: 50,
          width: 50,
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                merchant.name!,
                style: Styles.textStyle.itemHeaderTS,
              ),
            ],
          ),
        )
      ],
    );
  }
}
