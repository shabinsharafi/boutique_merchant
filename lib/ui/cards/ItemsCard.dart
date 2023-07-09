import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/styles/dimens.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/ItemDetailScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  ItemsCard(this.item, {Key? key}) : super(key: key);
  Item item;

  @override
  Widget build(BuildContext context) {
    print(item);
    return InkWell(
      onTap: () {
        NavigationService.changeScreen(ItemDetailScreen(item));
      },
      child: Container(
        padding: EdgeInsets.only(
          left: Styles.dimens.screenPaddingSmall,
          right: Styles.dimens.screenPaddingSmall,
          top: Styles.dimens.screenPaddingSmall,
        ),
        child: Row(
          children: [
            NetworkImageShimmer(
              (item.images!=null&&item.images!.isNotEmpty)?item.images![0]:"",
              height: Styles.dimens.width / 3.5,
              width: Styles.dimens.width / 3.5,
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
                  Text(
                    item.name!,
                    style: Styles.textStyle.itemHeaderTS,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    item.description!,
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
                        item.price!.toString(),
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
    );
  }
}
