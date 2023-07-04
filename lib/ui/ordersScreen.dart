import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/provider/OrdersVM.dart';
import 'package:boutique_merchant/ui/addItemScreen.dart';
import 'package:boutique_merchant/ui/cards/ordersCard.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cards/ItemsCard.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrdersProvider>(context, listen: false).getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar("Items"),
        body: Consumer<OrdersProvider>(builder: (context, provider, child) {
          if (provider.isLoginLoading || provider.ordersResponse == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (provider.ordersResponse != null &&
              provider.ordersResponse!.data!.items!.isNotEmpty)
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: provider.ordersResponse!.data!.items!.length,
                    itemBuilder: (context, index) {
                      return OrdersCard(provider.ordersResponse!.data!.items![index]);
                    },
                  ),
                ),
                /*PrimaryButton(
                  "Add New Item",
                  onTap: () {
                    NavigationService.changeScreen(AddItemScreen());
                  },
                )*/
              ],
            );
          return Container(
              child: Nothing(
            "No items added",
            "Add Item",
            onClick: () {
              NavigationService.changeScreen(AddItemScreen());
            },
          ));
        }));
  }

}
