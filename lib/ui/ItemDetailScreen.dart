import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/constants/customIcons.dart';
import 'package:boutique_merchant/models/favourite.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/ui/common/state_screen.dart';
import 'package:boutique_merchant/utils/extension.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/PrimaryOutline.dart';
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
                                child: NetworkImageShimmer(
                                  (widget.item.images != null && widget.item.images!.isNotEmpty)
                                      ?widget.item.images![selectedImage]: "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: SizedBox(),
                              ),
                              if(widget.item.images!=null)
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        for (int i = 0;
                                            i < widget.item.images!.length;
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
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Styles.color
                                                              .secondaryColor,
                                                          width:
                                                              i == selectedImage
                                                                  ? 1.5
                                                                  : 0)),
                                                  child: NetworkImageShimmer(
                                                    widget.item.images![i],
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
                            widget.item.name!,
                            style: Styles.textStyle.headingBoldTS,
                          ),
                          Text(
                            widget.item.category!.name!,
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
                                "$rupeeSymbol ${widget.item.price.toString()}",
                                style: Styles.textStyle.headingBoldTS,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          if (widget.item.merchant != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: MerchantProp(widget.item.merchant!),
                            ),
                          Text(
                            "Colors",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle.normalBoldTS,
                          ),
                          Row(
                            children: widget.item.colors!
                                .map((element) => Container(
                                      width: 30,
                                      height: 30,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color:
                                              Colors.white.parseColor(element)),
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
                            widget.item.materialType!.name!,
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
                            widget.item.description!,
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle.smallTS,
                          ),
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
            Padding(
              padding: EdgeInsets.all(Styles.dimens.screenPadding),
              child: Row(
                children: [
                  PrimaryOutline(
                    child: (widget.item.favourites != null &&
                        widget.item.favourites!.isNotEmpty)
                        ? Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Styles.color.secondaryColor,
                      size: 29,
                    )
                        : Icon(
                      FontAwesomeIcons.heart,
                      size: 29,
                    ),
                    height: 52,
                    width: Styles.dimens.width / 4,
                    onTap: () async {

                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: PrimaryButton(
                    "Add to Cart",
                    onTap: () {

                    },
                    paddingTop: 0,
                  )),
                  /*Expanded(
                      child: PrimaryButton("Buy Now", onTap: () {
                    provider.buyNow(widget.item.id);
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
