import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/order.dart';
import 'package:boutique_merchant/styles/dimens.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/ItemDetailScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:flutter/material.dart';

class OrdersCard extends StatelessWidget {
  OrdersCard(this.order, {Key? key}) : super(key: key);
  Order order;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //NavigationService.changeScreen(ItemDetailScreen(order));
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
              order.merchant!.image!,
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
                    order.merchant!.name!,
                    style: Styles.textStyle.itemHeaderTS,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    order.id!,
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
                        order.finalAmount!.toString(),
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
