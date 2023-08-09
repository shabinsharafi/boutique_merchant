import 'package:boutique_merchant/constants/constants.dart';
import 'package:boutique_merchant/constants/orderStatus.dart';
import 'package:boutique_merchant/provider/OrdersVM.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/cards/ordersCard.dart';
import 'package:boutique_merchant/widgets/OptionButton.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrdersProvider>(context, listen: false).getOrders();
  }

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar("Orders"),
        body: Consumer<OrdersProvider>(builder: (context, provider, child) {
          if (provider.isLoginLoading || provider.ordersResponse == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.ordersResponse != null &&
              provider.ordersResponse!.data!.items!.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: Styles.dimens.screenPadding,
                right: Styles.dimens.screenPadding,
                left: Styles.dimens.screenPadding,
                top: Styles.dimens.screenPaddingSmall,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: OptionButton(
                        "New",
                        selected: selected == 0,
                        onSelected: (String val) {
                          setState(() {
                            selected = 0;
                          });
                        },
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: OptionButton(
                        "On Going",
                        selected: selected == 1,
                        onSelected: (String val) {
                          print("dvdsfd");
                          setState(() {
                            selected = 1;
                          });
                          print(selected);
                        },
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: OptionButton(
                        "Completed",
                        selected: selected == 2,
                        onSelected: (String val) {
                          setState(() {
                            selected = 2;
                          });
                          print(selected);
                        },
                      )),
                    ],
                  ),
                  SizedBox(
                    height: Styles.dimens.screenPaddingSmall,
                  ),
                  Expanded(
                    flex: 1,
                    child: Builder(builder: (context) {
                      if (selected == 0) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: provider.ordersResponse!.data!.items!
                              .where((element) =>
                                  element.orderStatus ==
                                  OrderStatus.ORDER_PLACED.name)
                              .length,
                          itemBuilder: (context, index) {
                            return OrdersCard(
                                provider.ordersResponse!.data!.items!.where((element) =>
                                element.orderStatus ==
                                    OrderStatus.ORDER_PLACED.name).elementAt(index));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Expanded(
                              child: Container(
                                color: Colors.grey[200],
                                height: 1,
                                margin: EdgeInsets.only(bottom: 15,top: 15),
                              ),
                            );
                          },
                        );
                      }
                      if (selected == 1) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: provider.ordersResponse!.data!.items!
                              .where((element) =>
                                  element.orderStatus !=
                                  OrderStatus.ORDER_PLACED.name&&element.orderStatus !=
                                      OrderStatus.DELIVERED.name)
                              .length,
                          itemBuilder: (context, index) {
                            return OrdersCard(
                                provider.ordersResponse!.data!.items!.where((element) =>
                                element.orderStatus !=
                                    OrderStatus.ORDER_PLACED.name&&element.orderStatus !=
                                    OrderStatus.DELIVERED.name).elementAt(index));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Expanded(
                              child: Container(
                                color: Colors.grey[200],
                                height: 1,
                                margin: EdgeInsets.only(bottom: 15,top: 15),
                              ),
                            );
                          },
                        );
                      }
                      if (selected == 2) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: provider.ordersResponse!.data!.items!
                              .where((element) =>
                                  element.orderStatus ==
                                  OrderStatus.DELIVERED.name)
                              .length,
                          itemBuilder: (context, index) {
                            return OrdersCard(
                                provider.ordersResponse!.data!.items!.where((element) =>
                                element.orderStatus ==
                                    OrderStatus.DELIVERED.name).elementAt(index));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Expanded(
                              child: Container(
                                color: Colors.grey[200],
                                height: 1,
                                margin: EdgeInsets.only(bottom: 15,top: 15),
                              ),
                            );
                          },
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.ordersResponse!.data!.items!.length,
                        itemBuilder: (context, index) {
                          return OrdersCard(
                              provider.ordersResponse!.data!.items![index]);
                        },
                      );
                    }),
                  ),
                  /*PrimaryButton(
                    "Add New Item",
                    onTap: () {
                      NavigationService.changeScreen(AddItemScreen());
                    },
                  )*/
                ],
              ),
            );
          }
          return Container(
              child: Nothing(
            "No orders for you",
            //"Add Item",
            /*onClick: () {
              NavigationService.changeScreen(AddItemScreen());
            },*/
          ));
        }));
  }
}
