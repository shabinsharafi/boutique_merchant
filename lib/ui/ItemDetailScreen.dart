import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';

class ItemDetailScreen extends StatefulWidget {
  ItemDetailScreen(this.item, {Key? key}) : super(key: key);
  Item item;

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(""),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NetworkImageShimmer(
              widget.item.images![0],
              height: Styles.dimens.width / 3.5,
              width: Styles.dimens.width / 3.5,
            ),
            Container(
              padding: EdgeInsets.only(
                left: Styles.dimens.screenPaddingSmall,
                right: Styles.dimens.screenPaddingSmall,
                top: Styles.dimens.screenPaddingSmall,
              ),
              child: Row(
                children: [
                  
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          widget.item.name!,
                          style: Styles.textStyle.itemHeaderTS,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.item.description!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle.smallTS,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.item.price!.toString(),
                              style: Styles.textStyle.priceTS,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
