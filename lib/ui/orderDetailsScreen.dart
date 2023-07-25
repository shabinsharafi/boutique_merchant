import 'package:boutique_merchant/constants/constants.dart';
import 'package:boutique_merchant/models/cart.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/merchant.dart';
import 'package:boutique_merchant/models/order.dart';
import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/provider/OrdersVM.dart';
import 'package:boutique_merchant/ui/common/state_screen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/utils/extension.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/PrimaryRadioButton.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styles/styles.dart';

class OrderDetailScreen extends ScreenWidget {
  OrderDetailScreen(this.order, {Key? key}) : super(key: key);

  Order order;

  @override
  ScreenState<ScreenWidget> getState() {
    return _ItemDetailScreenState();
  }
}

class _ItemDetailScreenState extends ScreenState<OrderDetailScreen> {
  late OrdersProvider ordersProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ordersProvider = Provider.of<OrdersProvider>(context, listen: false);
    // Provider.of<CheckoutProvider>(context, listen: false).initCalculation();
  }

  @override
  Widget getWidget(BuildContext context) {
    return Scaffold(
      appBar: ToolBar("Order Details"),
      body: Consumer<OrdersProvider>(builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.all(Styles.dimens.screenPadding),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Order Id: ${widget.order.id!}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle.smallTS,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.order.user!.name!,
                            style: Styles.textStyle.regularBoldTS,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Ordered on ${widget.order.dateCreated!.toMMMDDYYYY()}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle.normalTS,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.order.orderStatus}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.textStyle.regularTS,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Items",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle.regularBoldTS,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(),
                        itemCount: widget.order.items!.length,
                        itemBuilder: (context, index) {
                          return getItemsCard(
                              Cart(item: widget.order.items![index]));
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 2,
                            childAspectRatio: 2),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Delivery Address",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle.regularBoldTS,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Builder(
                        builder: (context) {
                          return getDeliveryAddressCard(widget.order.address);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Payment Mode",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle.regularBoldTS,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.order.paymentMode!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle.regularBoldTS,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Sub Total",
                            style: Styles.textStyle.regularTS,
                          ),
                          Spacer(),
                          Text(
                            "$rupeeSymbol ${widget.order.totalAmount!}",
                            style: Styles.textStyle.priceTS,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Shipping",
                            style: Styles.textStyle.regularTS,
                          ),
                          Spacer(),
                          Text(
                            "$rupeeSymbol ${widget.order.deliveryCharge}",
                            style: Styles.textStyle.priceTS,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 2,
                        width: Styles.dimens.width,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total",
                            style: Styles.textStyle.regularTS,
                          ),
                          Spacer(),
                          Text(
                            "$rupeeSymbol ${widget.order.finalAmount}",
                            style: Styles.textStyle.priceTS,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Builder(builder: (context) {
                        if (widget.order.orderStatus ==
                            OrderStatus.ORDER_PLACED.name) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryButton(
                                "Reject Order",
                                onTap: () {
                                  provider.updateOrder(widget.order.id,
                                      OrderStatus.ORDER_REJECTED);
                                },
                                color: Colors.redAccent,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              PrimaryButton(
                                "Accept Order",
                                onTap: () {
                                  provider.updateOrder(widget.order.id,
                                      OrderStatus.ORDER_ACCEPTED);
                                },
                              ),
                            ],
                          );
                        } else if (widget.order.orderStatus ==
                                OrderStatus.ORDER_CANCELED.name ||
                            widget.order.orderStatus ==
                                OrderStatus.DELIVERED.name ||
                            widget.order.orderStatus ==
                                OrderStatus.ORDER_REJECTED.name) {
                          return PrimaryButton(
                            "Update Status",
                            onTap: () {
                              showBottomSheet(
                                  context: context,
                                  builder: (context) => statusSheet());
                              // provider.updateOrder(
                              //     widget.order.id, OrderStatus.ORDER_REJECTED);
                            },
                          );
                        }
                        return SizedBox();
                      }),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  statusSheet() {
    var status;
    return Container(
      padding: EdgeInsets.all(Styles.dimens.screenPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        children: [
          for (int i = 3; i < OrderStatus.values.length; i++)
            InkWell(
              onTap: () {},
              child: PrimaryRadioButton(
                OrderStatus.values[i].name,
                selected: status == OrderStatus.values[i].name,
                onSelected: () {
                  setState(() {
                    status = OrderStatus.values[i].name;
                  });
                },
              ),
            ),
          PrimaryButton(
            "Update Status",
            onTap: () {
              ordersProvider.updateOrder(widget.order.id, status);
            },
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}

getDeliveryAddressCard(item) {
  return Container(
    width: Styles.dimens.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
    padding: EdgeInsets.only(
      left: Styles.dimens.screenPaddingSmall,
      right: Styles.dimens.screenPaddingSmall,
      top: Styles.dimens.screenPaddingSmall,
      bottom: Styles.dimens.screenPaddingSmall,
    ),
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
          height: 2,
        ),
        Text(
          item.address!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.textStyle.normalTS,
        ),
        SizedBox(
          height: 1,
        ),
        Text(
          item.pincode!,
          style: Styles.textStyle.normalTS,
        ),
        SizedBox(
          height: 1,
        ),
        Text(
          item.mobile!,
          style: Styles.textStyle.normalTS,
        )
      ],
    ),
  );
}

getItemsCard(Cart item) {
  return Container(
    child: Row(
      children: [
        SizedBox(
          width: 90,
          child: AspectRatio(
            aspectRatio: .90,
            child: NetworkImageShimmer(
              (item.item!.images != null && item.item!.images!.isNotEmpty)
                  ? item.item!.images![0]
                  : "",
            ),
          ),
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
                item.item!.name!,
                style: Styles.textStyle.smallBoldTS,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$rupeeSymbol ${item.item!.price!.toString()}",
                    style: Styles.textStyle.smallBoldTS
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

class MerchantProp extends StatelessWidget {
  MerchantProp(this.merchant);

  Merchant merchant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AspectRatio(
            aspectRatio: 0.90,
            child: NetworkImageShimmer(
              merchant.image,
            )),
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
