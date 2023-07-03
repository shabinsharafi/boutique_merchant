import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/styles/dimens.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  ItemsCard(this.item, {Key? key}) : super(key: key);
  Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Styles.dimens.screenPaddingSmall,
          right: Styles.dimens.screenPaddingSmall,
          top: Styles.dimens.screenPaddingSmall,),
      child: Row(
        children: [
          NetworkImageShimmer(
            item.images![0],
            height: Styles.dimens.width / 3,
            width: Styles.dimens.width / 3,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name!,
                  style: Styles.textStyle.itemHeaderTS,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  item.description!,
                  style: Styles.textStyle.smallTS,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
